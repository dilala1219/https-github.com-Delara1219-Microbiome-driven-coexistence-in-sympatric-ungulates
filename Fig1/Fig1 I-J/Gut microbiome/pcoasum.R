# 安装所需的包，如果未安装，请取消注释下面的行并运行
install.packages("vegan")
install.packages("ggplot2")
install.packages("tidyverse")

# 加载必要的包
library(vegan)
library(ggplot2)
library(tidyverse)

# 读取Bray-Curtis距离矩阵和分组信息
bray_curtis <- read.csv("./bray_curtis.csv", row.names = 1)
group_info <- read.csv("./Gut microbiome/group1.csv")

# 检查数据
head(bray_curtis)
head(unifrac)
head(unifrac_binary)
head(group_info)

# 计算PCoA
pcoa_result <- cmdscale(bray_curtis, k = 2, eig = TRUE)

# 提取坐标
pcoa_coords <- as.data.frame(pcoa_result$points)
colnames(pcoa_coords) <- c("PC1", "PC2")

# 添加分组信息
pcoa_coords$Sample <- rownames(pcoa_coords)
merged_data <- merge(pcoa_coords, group_info, by.x = "Sample", by.y = "Sample")

# 计算PC1和PC2的百分比
percent_variance <- (pcoa_result$eig / sum(pcoa_result$eig)) * 100
pc1_percent <- round(percent_variance[1], 2)
pc2_percent <- round(percent_variance[2], 2)

# 绘制PCoA图
ggplot(merged_data, aes(x = PC1, y = PC2, shape = Season, color = Group, fill = Group)) +
  geom_point(size = 4, stroke = 0, color = "grey", show.legend = FALSE) +  # 添加黑色边框
  geom_point(size = 3, aes(fill = Group)) +  # 自定义颜色填充
  theme_minimal() +
  labs(title = "PCoA of Bray-Curtis Dissimilarity",
       x = paste("PC1 (", pc1_percent, "%)", sep = ""),
       y = paste("PC2 (", pc2_percent, "%)", sep = "")) +
  scale_shape_manual(values = c(16, 15)) +  # 自定义形状
  theme(legend.position = "right") +
  scale_color_manual(values = c("blue", "red", "green", "yellow", "purple", "orange")) +  # 自定义颜色
  scale_fill_manual(values = c("blue", "red", "green", "yellow", "purple", "orange")) +  # 添加填充颜色
theme(legend.position = "right",
      panel.grid.major = element_blank(),  # 去除主网格线
      panel.grid.minor = element_blank(),  # 去除次网格线
      axis.line = element_line(colour = "black"),  # 添加坐标轴线
      axis.ticks = element_line(colour = "black")) +  # 添加坐标轴刻度线
  geom_vline(xintercept = 0, linetype = "dashed") +  # 添加虚线纵轴
  geom_hline(yintercept = 0, linetype = "dashed")   # 添加虚线横轴

# 显示图形
ggsave("./pcoasum2.pdf", width = 8, height = 6)  # 保存图形
