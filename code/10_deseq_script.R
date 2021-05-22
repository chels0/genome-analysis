
directory <- "~/Skolgrejer/Genomanalys/ERR2"
sample_files <- c('ERR2036629_mapped_read_counts_continuous.txt', 'ERR2036630_mapped_read_counts_continuous.txt', 'ERR2036631_mapped_read_counts_batch', 'ERR2036632_mapped_read_counts_batch.txt', 'ERR2036633_mapped_read_counts_continuous.txt', 'ERR2117288_mapped_read_counts_continuous.txt', 'ERR2117289_mapped_read_counts_continuous.txt', 'ERR2117290_mapped_read_counts_batch.txt', 'ERR2117291_mapped_read_counts_batch.txt', 'ERR2117292_mapped_read_counts_continuous.txt')
condition_vector <- c('continuous', 'continuous', 'batch', 'batch', 'continuous', 'continuous', 'continuous', 'batch', 'batch', 'continuous')

sample_table <- data.frame(sampleName = sample_files, fileName = sample_files, condition = condition_vector)

sample_table$condition <- factor(sample_table$condition)

library("DESeq2")

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)

ddsHTSeq <- DESeq(ddsHTSeq)
resultsNames(ddsHTSeq)

res <- lfcShrink(ddsHTSeq, coef = "condition_continuous_vs_batch", type = "apeglm")

plotMA(res, ylim=c(-6,6))

library(ReportingTools)

report <- HTMLReport(shortName = 'DiffExp_analysis_chelsea', title = 'Differential expression analysis on continous vs batch cultures with gene names', reportDirectory = ".")
publish(ddsHTSeq, report, pvalueCutoff=0.05, make.plots = TRUE, factor = sampleTable$condition, reportDir = ".")
finish(report)