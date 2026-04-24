#' 发票上传生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' manualInvoiceUI()
manualInvoiceUI <- function(tabTitle ='电子税务局手工开票信息更新',
                         colTitles =c('操作区域','操作区域','显示区域'),
                         widthRates =c(6,6,12),
                         func_left = manualInvoiceUI_left,
                         func_right =manualInvoiceUI_right,
                         func_bottom = manualInvoiceUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' manualInvoiceUI_left()
manualInvoiceUI_left <- function() {


  res <- tagList(

    tsui::uiTemplate(templateName = '电子税务局手工开票信息更新表模板'),

    tsui::mdl_files(id = 'multi_files_manualInvoice',label = '多文件显示',fileType = '.xlsx'),

    shiny::actionButton('btn_manualInvoice_click','上传并更新数据')


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' manualInvoiceUI_bottom()
manualInvoiceUI_right <- function() {
  res <- tagList(



    shiny::actionButton('btn_manualInvoice_view','查询上传日志'),

    tsui::mdl_download_button(id ='dl_manualInvoice',label = '下载查询数据')



  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' manualInvoiceUI_bottom()
manualInvoiceUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'manualInvoice_resultView',label ='结果显示' ))

  )
  return(res)

}
