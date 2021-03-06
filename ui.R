#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# The documentation for this GOVUK components can be found at:
#
#    https://github.com/moj-analytical-services/shinyGovstyle
#

shinyjs::useShinyjs()

ui <- fluidPage(
  tags$head(
    tags$link(
      rel = "stylesheet", 
      type = "text/css", 
      href = "style.css")
  ),
  shinyGovstyle::header(
    main_text = "DfE", 
    secondary_text = "Attendance prediction", 
    logo = "shinyGovstyle/images/moj_logo.png"
  ),
  shiny::navlistPanel(
    "",
    id = "navlistPanel",
    widths = c(2, 8),
    well = FALSE,
    tabPanelOne(),
    tabPanelTwo(),
    tabPanelThree(),
    tabPanelFour()
  ),
  gov_layout(
    size = "full",
    tags$br(),
    tags$br(),
    tags$br(),
    tags$br(),
    tags$br()
  ),
  tags$script(
    src="script.js"
  ),
  tags$script(HTML(
    "
    function plotZoom(el){
        el = $(el);
        var parent = el.parent().parent();
        if(el.attr('data-full_screen') === 'false') {
            $('html').css('visibility', 'hidden');
            parent.addClass('full-screen').trigger('resize').hide().show();
            $('.fullscreen-button').text('Exit full screen');
            el.attr('data-full_screen', 'true');
            setTimeout(function() {
              $('html').css('visibility', 'visible');
            }, 700);
            
        } else {
            parent.removeClass('full-screen').trigger('resize').hide().show();
            $('.fullscreen-button').text('View full screen');
            el.attr('data-full_screen', 'false');
        }
    }
    
    $(function(){
       $('.plotly-full-screen  .plotly.html-widget').append(
        `
        <div style='position: relative;'>
            <button onclick=plotZoom(this) class='plot-zoom' data-full_screen='false' title='Full screen'>
                <a href='#' class='govuk-link fullscreen-button'>View full screen</a>
            </button>
        </div>
        `); 
    })
    "
  )),
  footer(full = TRUE)
)
