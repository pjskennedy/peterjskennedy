module ActionMailer
  class Base
    def template_path
      File.join(template_root, mailer_name)
    end
  end
end