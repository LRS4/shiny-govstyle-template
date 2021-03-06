tabPanelOne <- function() {
  return (
    shiny::tabPanel(
      "Select Type",
      value = "panel1",
      gov_layout(
        size = "full",
        heading_text(
          text_input = "Page 1",
          size = "l"
        ),
        label_hint(
          "label1",
          "These are some examples of the types of user\n                   select type inputs that you can use"
        ),
        heading_text("radio_button_Input", size = "s"),
        radio_button_Input(
          inputId = "name_changed",
          label = "Have you changed your name?",
          choices = c("Yes",
                      "No"),
          inline = TRUE,
          hint_label = "This includes changing your last name or spelling\n                            your name differently."
        ),
        heading_text("checkbox_Input", size = "s"),
        checkbox_Input(
          inputId = "checkID",
          cb_labels = c(
            "Waste from animal carcasses",
            "Waste from mines or quarries",
            "Farm or agricultural waste"
          ),
          checkboxIds = c("op1", "op2", "op3"),
          label = "Which types of waste do you transport?",
          hint_label = "Select all that apply."
        ),
        heading_text(
          text_input = "select_Input", 
          size = "s"
        ),
        select_Input(
          inputId = "sorter",
          label = "Sort by",
          select_text = c(
            "Recently published",
            "Recently updated",
            "Most views",
            "Most comments"
          ),
          select_value = c("published",
                           "updated", "view", "comments")
        ),
        heading_text(
          text_input = "file_Input",
          size = "s"
        ),
        file_Input(
          inputId = "file1",
          label = "Upload a file"
        ),
        heading_text(
          text_input = "button_Input",
          size = "s"
        ),
        button_Input(
          inputId = "btn1", 
          label = "Go to next page"
        )
      )
    )
  )
}

tabPanelTwo <- function() {
  return (
    shiny::tabPanel(
      "Text Types",
      value = "panel2",
      gov_layout(
        size = "full",
        heading_text("Page 2", size = "l"),
        label_hint(
          "label2",
          "These are some examples of the types of user\n                   text inputs that you can use"
        ),
        heading_text("date_Input", size = "s"),
        date_Input(
          inputId = "date1",
          label = "What is your date of birth?",
          hint_label = "For example, 31 3 1980"
        ),
        heading_text("text_Input", size = "s"),
        text_Input(inputId = "txt1",
                   label = "Event name"),
        heading_text("text_area_Input",
                     size = "s"),
        text_area_Input(
          inputId = "text_area1",
          label = "Can you provide more detail?",
          hint_label = "Do not include personal or financial information,\n          like your National Insurance number or credit card details."
        ),
        text_area_Input(
          inputId = "text_area2",
          label = "How are you today?",
          hint_label = "Leave blank to trigger error",
          error = T,
          error_message = "Please do not leave blank",
          word_limit = 300
        ),
        heading_text("button_Input",
                     size = "s"),
        button_Input("btn2", "Go to next page"),
        button_Input("btn3", "Check for errors", type = "warning")
      )
    )
  )
}

tabPanelThree <- function() {
  return (
    shiny::tabPanel(
      "Feedback Types",
      value = "panel3",
      gov_layout(
        size = "full",
        heading_text("Page 3", size = "l"),
        label_hint(
          "label3",
          "These are some examples of the types of user\n                   feedback inputs that you can use"
        ),
        heading_text("tag_Input", size = "s"),
        tag_Input("tag1",
                  "NAVY"),
        tag_Input("tag2", "RED", "red"),
        tag_Input("tag3", "BLUE", "blue"),
        tag_Input("tag4",
                  "YELLOW", "yellow"),
        shiny::tags$br(),
        shiny::tags$br(),
        heading_text("details", size = "s"),
        details(
          inputId = "detID",
          label = "Help with nationality",
          help_text = "We need to know your nationality so we can work out\n              which elections you're entitled to vote in. If you cannot provide\n              your nationality, you'll have to send copies of identity\n              documents through the post."
        ),
        heading_text("insert_text", size = "s"),
        insert_text(inputId = "insertId",
                    text = "It can take up to 8 weeks to register a lasting\n                        power of attorney if there are no mistakes in the\n                        application."),
        heading_text("warning_text", size = "s"),
        warning_text(inputId = "warn", text = "You can be fined up to £5,000 if you do\n              not register."),
        heading_text("panel_output", size = "s"),
        panel_output(
          inputId = "panId",
          main_text = "Application complete",
          sub_text = "Your reference number <br> <strong>HDJ2123F</strong>"
        ),
        heading_text("noti_banner", size = "s"),
        noti_banner(
          "notId",
          title_txt = "Important",
          body_txt = "You have 7 days left to send your application.",
          type = "standard"
        )
      )
    )
  )
}

tabPanelFour <- function() {
  Months <- c("January", "February", "March")
  Bikes <- c("£85", "£75", "£165")
  Cars <- c("£95", "£55", "£125")
  example_data <- data.frame(Months, Bikes, Cars)
  
  return (
    shiny::tabPanel(
      "Tabs Layout",
      value = "panel4",
      gov_layout(
        size = "full",
        heading_text("Page 4", size = "l"),
        label_hint(
          "label3",
          "This is an example of using a tabbed layout"
        ),
        tabsetPanel(
          type = "tabs",
          tabPanel(
            title = "Plots",
            tags$br(),
            tags$br(),
            heading_text("Plots", size = "m"),
            div(
              class = "plotly-full-screen",
              shinycssloaders::withSpinner(
                plotly::plotlyOutput(
                  outputId = "plot"
                ),
                type = 8,
                color = "#1D70B8",
                size = 0.5
              )
            ),
            tags$br(),
            tags$br(),
            select_Input(
              inputId = "sankey_filter",
              label = "Filter by",
              select_text = c(
                "All",
                "FSM"
              ),
              select_value = c(
                "all",
                "fsm"
              )
            ),
            div(
              class = "plotly-full-screen",
              shinycssloaders::withSpinner(
                plotly::plotlyOutput(
                  outputId = "sankey"
                ),
                type = 8,
                color = "#1D70B8",
                size = 0.5
              )
            )
          ),
          tabPanel(
            title = "Map",
            tags$br(),
            tags$br(),
            heading_text("Map", size = "m"),
            shinycssloaders::withSpinner(
              leafletOutput(
                "mymap", 
                width="100%", 
                height="865px"
              ),
              type = 8,
              color = "#1D70B8",
              size = 0.5
            )
          ),
          tabPanel(
            tags$br(),
            tags$br(),
            title = "Table",
            heading_text("Table", size = "m"),
            shinyGovstyle::govTable(
              inputId = "tab1", 
              df = example_data, 
              caption = NULL, 
              caption_size = "l", 
              num_col = c(2,3),
              width_overwrite = c("one-half", "one-quarter", "one-quarter")
            )
          ),
        )
      )
    )
  )
}
