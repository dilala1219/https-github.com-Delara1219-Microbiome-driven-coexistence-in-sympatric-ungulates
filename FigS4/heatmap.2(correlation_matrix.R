# 本文介绍了如何画两组变量（特征）的相关关系热图。

# 准备数据
# 两组变量的数据可以像下面这样处理，分别保存在两个csv文件中。
# 导入数据及数据预处理
setwd("./FigS4")
rows <- read.csv("warmfamilydiettop20.csv")
cols <- read.csv("warmfamilyguttop30.csv")
str(rows)

str(cols)

# 简单热图
# 构建相关关系矩阵
library(psych)
data.corr <- corr.test(rows[, 2:21], cols[, 2:31], method="spearman", adjust="fdr")
data.r <- data.corr$r  # 相关系数
data.p <- data.corr$p  # p值

# 画热图
library(pheatmap)
# 设置颜色参数为蓝色和红色
my_colors <- colorRampPalette(c("blue", "white", "red"))(n = 100)
# 进行层次聚类并绘制热图
hc <- hclust(dist(data.r), method = "average")
pheatmap(data.r, clustering_method = "average", cluster_rows = TRUE, cluster_cols = TRUE, color=my_colors)

# 只对列进行聚类
pheatmap(data.r, clustering_method = "average", cluster_rows = F, cluster_cols = TRUE, color=my_colors)

# 只对行进行聚类
pheatmap(data.r, clustering_method = "average", cluster_rows = T, cluster_cols = F, color=my_colors, border_color=NA)

# 将相关系数显示在图上
data.r.fmt <- matrix(sprintf("%.2f", data.r), nrow=nrow(data.p))  # 只保留小数点后两位
pheatmap(data.r, clustering_method="average", cluster_rows=F, display_numbers=data.r.fmt, color=my_colors)

# 在图上加上显著性标记
getSig <- function(dc) {
  sc <- ''
  if (dc < 0.001) sc <- '***'
  else if (dc < 0.01) sc <- '**'
  else if (dc < 0.05) sc <- '*'
  sc
}
sig.mat <- matrix(sapply(data.p, getSig), nrow=nrow(data.p))
str(sig.mat)
pheatmap(data.r, clustering_method="average", cluster_rows=F, display_numbers=sig.mat, color=my_colors)

# 如果想进一步改变图形效果，可以参考pheatmap函数的用法，修改相应的参数。比如：聚类方式改为complete，加上标题等。
pheatmap(data.r, clustering_method="complete", cluster_rows=F, display_numbers=sig.mat, main="Corr Heatmap")