class Admin::CertificatesController < AdminController

  def index
    @cerificates =  CertificateGeneral.all
  end

  def download
    @certificate = CertificateGeneral.find(params[:id])
    respond_to  do |format|
      format.pdf do
        render pdf: "#{@certificate.id}-#{@certificate.member_name}-certificate",
        template: 'admin/certificates/download.html.slim'
      end
    end
  end

end
