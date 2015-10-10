module UsersHelper
    def job_title_icon
        # 現在アクセスしているuserのprofileのjob_titleがDeveloper
        # だった場合、<i class='fa fa-code'></i>を表示。
        if @user.profile.job_title == "Developer"
            "<i class='fa fa-code'></i>".html_safe
        elsif @user.profile.job_title == "Entrepreneur"
            "<i class='fa fa-lightbulb-o'></i>".html_safe
        elsif @user.profile.job_title == "Investor"
            "<i class='fa fa-dollar'></i>".html_safe
        end
    end
end