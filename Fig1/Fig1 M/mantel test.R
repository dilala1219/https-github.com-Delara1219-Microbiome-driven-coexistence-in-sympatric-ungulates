# 如果没有安装 linkET，请运行：
# install.packages("devtools")
# devtools::install_github("Hy4m/linkET")

library(linkET)
library(ggplot2)
library(dplyr)
library(vegan) # 用于计算距离矩阵

# 定义绘图函数
draw_mantel_plot <- function(micro_df, diet_df, group_name) {
  
  # 1. 计算 Mantel Test
  # 我们需要计算每个微生物科(spec)与整体食性组成(env)之间的相关性
  # mantel_test 函数会自动处理
  mantel_res <- mantel_test(micro_df, diet_df,
                            spec.select = list(Diet = 1:ncol(micro_df))) %>% 
    mutate(rd = cut(r, breaks = c(-Inf, 0.2, 0.4, Inf), 
                    labels = c("< 0.2", "0.2-0.4", ">= 0.4")), # 定义R值粗细
           pd = cut(p, breaks = c(-Inf, 0.01, 0.05, Inf), 
                    labels = c("< 0.01", "0.01-0.05", "> 0.05"))) # 定义P值颜色
  
  # 2. 绘制相关性热图 + Mantel连线
  p <- qcorrplot(micro_df, type = "lower", diag = FALSE) +
    geom_square() + # 热图方块
    # 添加连线 (Mantel test 结果)
    geom_couple(data = mantel_res, 
                aes(colour = pd, size = rd, linetype = r > 0), 
                curvature = 0.1) +
    # 设置连线颜色 (参考截图：红、绿、蓝)
    scale_fill_gradient2(low = "#3B9AB2", mid = "white", high = "#F21A00") + # 热图颜色
    scale_colour_manual(values = c("< 0.01" = "#E41A1C", 
                                   "0.01-0.05" = "#4DAF4A", 
                                   "> 0.05" = "#377EB8")) + 
    scale_size_manual(values = c("< 0.2" = 0.5, "0.2-0.4" = 1.2, ">= 0.4" = 2.5)) +
    scale_linetype_manual(values = c("TRUE" = "solid", "FALSE" = "dashed")) + # 正负相关连线
    # 细节修饰
    guides(size = guide_legend(title = "Mantel's r", order = 2),
           colour = guide_legend(title = "Mantel's p", order = 1),
           fill = guide_colorbar(title = "Pearson's r", order = 3)) +
    labs(title = group_name) +
    theme(plot.title = element_text(hjust = 0.5, size = 14, color = "darkgreen"))
  
  return(p)
}
