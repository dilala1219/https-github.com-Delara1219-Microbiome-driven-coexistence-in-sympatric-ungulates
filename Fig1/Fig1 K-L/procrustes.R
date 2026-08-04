#Procrustes analysis
library("vegan")
library("ggplot2")
library("cowplot")
#set working environment
setwd("原始数据与代码对应/procrustes")
getwd()
#加载已计算出的 Bray-Curtis 距离矩阵：
metadata = read.csv(file = "coldgroup.csv", header = TRUE, check.names = FALSE, row.names = 1)
dist.abund <- read.csv("diet.bray.cold.csv", header = TRUE, row.names = 1)
mdist.abund <- read.csv("micro.bray.cold.csv", header = TRUE, row.names = 1)

any(is.na(metadata))
any(is.na(dist.abund))
any(is.na(mdist.abund))
# 将数据框转换为距离矩阵：
dist.abund <- as.dist(dist.abund)
mdist.abund <- as.dist(mdist.abund)

#make pcoas
dpcoa <- as.data.frame(cmdscale(dist.abund)) 

mpcoa <- as.data.frame(cmdscale(mdist.abund))

#procrustes analysis
pro <- procrustes(X = dpcoa, Y = mpcoa, scale = TRUE,symmetric = TRUE)

pro_test <- protest(dpcoa,mpcoa,perm=9999)

eigen <- sqrt(pro$svd$d)
percent_var <- signif(eigen/sum(eigen), 4)*100

beta_pro <- data.frame(pro$X)
trans_pro <- data.frame(pro$Yrot)
beta_pro$UserName <- rownames(beta_pro)
beta_pro$type <- "Diet(Bray_curtis)"

species <- metadata$Group

beta_pro=cbind(beta_pro,species)

trans_pro$UserName <- rownames(trans_pro)
trans_pro$type <- "Microbiome"
species <- metadata$Group

trans_pro=cbind(trans_pro,species)
colnames(trans_pro) <- colnames(beta_pro)
pval <- signif(pro_test$signif, 1)
plot <- rbind(beta_pro, trans_pro)
col1 = rgb(250/255,60/255,60/255)
col4 = rgb(0/255,200/255,200/255)
col8 = rgb(160/255,0/255,200/255)
col10 = rgb(0/255,160/255,255/255)
col6 = rgb(0/255,175/255,0/255)

complete_cases <- complete.cases(plot)
plot_complete <- plot[complete_cases, ]

grass_food_micro <- ggplot(plot) +
  geom_point(size = 4, alpha=0.75, aes(x = V1, y = V2, color = species,shape=type))+ 
  scale_color_manual(values = c(col1,col4,col8,col4)) +
  theme_classic() +
  scale_x_continuous(limits = c(-0.40,0.20))+
  scale_y_continuous(limits = c(-0.40,0.20))+
  geom_line(aes(x= V1, y=V2, group=UserName), col = "darkgrey", alpha = 0.6,size=0.2) +
  theme(panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.title = element_blank(),
        legend.text = element_text(size=10,colour="black"),
        legend.position = 'bottom',
        axis.text = element_text(size=10,colour="black"),
        axis.title = element_text(size=13,colour="black"),
        aspect.ratio = 1) +
  guides(color = guide_legend(ncol = 1)) +
  annotate("text", x = 0.10, y = -0.40, label = paste0("p-value=",pval), size = 4) +
  xlab(paste0("PC 1 [",percent_var[1],"%]")) +
  ylab(paste0("PC 2 [",percent_var[2],"%]")) 

# 检查点图层
missing_points <- is.na(plot$V1) | is.na(plot$V2)

# 检查线图层
missing_lines <- is.na(plot$V1) | is.na(plot$V2) | is.na(plot$UserName)


summary(plot)

grass_food_micro_leg <- get_legend(grass_food_micro) 

grass_food_micro + theme(legend.position = "right")

