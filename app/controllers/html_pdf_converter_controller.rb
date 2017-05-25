class HtmlPdfConverterController < ApplicationController
    #before_action :authenticate_user!
    require 'rubygems'
    require 'pdfcrowd'

    #get html page to be generate as pdf
    def pdf_layout
        @project_collection = Project.find(params[:id])
        render :layout => "pdf"
    end

    #generate actuall pfd
    def generate
        begin
          # create an API client instance
          client = Pdfcrowd::Client.new("Ruaan", "f28ec8c1e3b2caee58679f0ed5dff6b6")

          # convert a web page and store the generated PDF to a variable
          # pdf = client.convertFile("app/views/html_pdf_converter/pdf_layout.html.erb")
          pdf = client.convertURI("http://02b7e0a3.ngrok.io/pdf_converter/1?")
          # send the generated PDF
          send_data(pdf,
                    :filename => "#{Time.now}_project_report.pdf",
                    :type => "application/pdf",
                    :disposition => "attachment"
                    )
        rescue Pdfcrowd::Error => why
          render :text => why
        end
    end

end
