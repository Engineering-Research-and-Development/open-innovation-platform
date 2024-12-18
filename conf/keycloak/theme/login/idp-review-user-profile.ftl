<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        ${msg("loginIdpReviewProfileTitle")}
    <#elseif section = "form">
        <form id="kc-idp-review-profile-form" action="${url.loginAction}" method="post">
            <div class="flex flex-col gap-y-4">
                <@userProfileCommons.userProfileFormFields/>
            </div>

            <div id="kc-form-options">
                <div></div>
            </div>

            <div id="kc-form-buttons" class="space-x-4 mt-4 flex items-center justify-end">
                <@buttons.button label="doSubmit" name="doSubmit" id="doSubmit" class=[]/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>