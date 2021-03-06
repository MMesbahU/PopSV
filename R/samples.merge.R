##' Merge files for different samples.
##' @title Merge data.frame across samples
##' @param files.df a data.frame with information about each output file.
##' @param samples the names of the samples to use.
##' @param files.col the name of 'files.df' to use for each 'res' element.
##' @param nb.cores the number of cores to use.
##' @param sig.digits the number of significant digits. Default is 6.
##' @return the merged data.frame
##' @author Jean Monlong
##' @export
samples.merge <- function(files.df, samples, files.col, nb.cores = 1, sig.digits = 6) {
    
    res.1 = as.data.frame(data.table::fread(subset(files.df, sample == samples[1])[, 
        files.col], header = TRUE))
    res.l = parallel::mclapply(subset(files.df, sample %in% samples)[, files.col], 
        function(fi) {
            unlist(data.table::fread(fi, header = TRUE)[, 4, with = FALSE])
        }, mc.cores = nb.cores)
    res.l = matrix(signif(unlist(res.l), sig.digits), length(res.l[[1]]))
    colnames(res.l) = samples
    
    return(cbind(res.1[, c("chr", "start", "end")], res.l))
} 
