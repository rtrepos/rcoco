#' @export
summary.CocoProblemList = function(object, ...) {
  size = length(object)
  dims = extractSubList(object, "dimension")
  funs = extractSubList(object, "fun.nr")
  insts = extractSubList(object, "inst.nr")
  fids = extractSubList(object, "function.ids")
  tab = data.frame(d = dims, fun = funs, inst = insts)
  dim.range = sort(unique(dims))
  fun.range = sort(unique(funs))
  inst.range = sort(unique(insts))
  makeS3Obj("SummaryProblemList", tab = tab, size = size,
    dim.range = dim.range, fun.range = fun.range, inst.range = inst.range)
}

#' @export
print.SummaryProblemList = function(x, ...) {
  catf("ProblemListOverview: (%i)", x$size)
  catf("dims: %s", collapse(x$dim.range))
  catf("funs: %s", toRangeStr(x$fun.range))
  catf("insts: %s", toRangeStr(x$inst.range))
  printHead(x$tab)
}
