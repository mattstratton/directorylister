require "net/smtp"

module OrgName
  class SendEmail < Chef::Handler
    def report
      message  = "From: sender_name <jbruso@trueblue.com>\n"
      message << "To: recipient_address <jbruso@trueblue.com>\n"
      message << "Subject: chef-client Run\n"
      message << "Date: #{Time.now.rfc2822}\n\n"
      message << "Chef updated resources on #{node.name}\n"
      run_status.updated_resources.each do |resource|
        message << "recipe[#{resource.cookbook_name}::#{resource.recipe_name}] ran '#{resource.action}' on #{resource.resource_name} '#{resource.name}'\n"
      end
      message << Array(backtrace).join("\n")
      Net::SMTP.start('10.10.4.113', 25) do |smtp|
        smtp.send_message message, 'jbruso@trueblue.com', 'jbruso@trueblue.com'
      end
    end
  end
end