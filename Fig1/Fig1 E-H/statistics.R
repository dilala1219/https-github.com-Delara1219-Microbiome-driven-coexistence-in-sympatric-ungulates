
# 如果你没有安装这些包，请先运行以下代码安装：
# install.packages("car")      # 用于输出方差分析表
# install.packages("emmeans")  # 用于计算估计差值、95% CI和精确p值
# install.packages("dplyr")    # 用于数据处理

library(car)
library(emmeans)
library(dplyr)

# 假设你的数据包含三列：Diversity (多样性指数，如Chao1), Species (物种), Season (季节)
# 下面是一段模拟数据，你在实际运行时请替换为：mydata <- read.csv("你的文件.csv")
set.seed(123)
mydata <- data.frame(
  Diversity = c(rnorm(20, 80, 15), rnorm(20, 100, 20), rnorm(20, 3000, 500)), # 模拟多样性
  Species = rep(c("Siberian_ibex", "Marco_Polo_sheep", "Blue_sheep"), each = 20),
  Season = rep(c("Summer", "Winter"), times = 30)
)

# 【关键步骤】将分类变量转换为 Factor，并固定顺序（和你的图一致）
mydata$Species <- factor(mydata$Species, levels = c("Siberian_ibex", "Marco_Polo_sheep", "Blue_sheep"))
mydata$Season <- factor(mydata$Season, levels = c("Summer", "Winter"))

# 1. 构建线性模型 (Diversity 作为因变量，Species 和 Season 及其交互项作为自变量)
# 注意：* 号代表既包含主效应，也包含交互效应 (等同于 Species + Season + Species:Season)
model_anova <- lm(Diversity ~ Species * Season, data = mydata)

# 2. 输出方差分析表 (推荐使用 car 包的 Anova 函数，Type II 或 III 适合样本量不完全一致的数据)
cat("\n=== 1. 双因素方差分析表 (ANOVA Table) ===\n")
Anova(model_anova, type = "II") 
# 在这里的输出中，寻找 "Species:Season" 这一行的 Pr(>F) 的值，这就是交互作用的精确 p 值。

cat("\n=== 2. 获取每个物种在不同季节的估算均值和 95% CI ===\n")
# ~ Season | Species 的意思是：在每个物种内部，计算季节的估算边际均值
emm_results <- emmeans(model_anova, ~ Season | Species)
print(emm_results) # 这里的 lower.CL 和 upper.CL 就是 95% CI


cat("\n=== 3. 计算从 Summer 到 Winter 的估计差值 (Estimated differences) 及精确 p/q 值 ===\n")
# 对上述均值进行两两比较（即冬季减去夏季）
pairwise_results <- pairs(emm_results)

# 打印结果并输出精确的 p 值。默认情况下使用 Tukey 方法调整 p 值，这相当于 q 值（FDR校正）
summary(pairwise_results, infer = c(TRUE, TRUE)) 






