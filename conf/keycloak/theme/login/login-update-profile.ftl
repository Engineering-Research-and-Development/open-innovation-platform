<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <form id="kc-update-profile-form" action="${url.loginAction}" method="post">
            <div class="flex flex-col gap-y-4">
                <@userProfileCommons.userProfileFormFields/>
            </div>
            
            <div id="kc-form-buttons" class="space-x-4 flex items-center justify-end">
                <#if isAppInitiatedAction??>
                    <@buttons.buttonOutline label="doCancel" name="cancel-aia" id="doCancel" class=[]/>
                    <@buttons.button label="doSubmit" name="doSubmit" id="doSubmit" class=[]/>
                <#else>
                    <@buttons.button label="doSubmit" name="doSubmit" id="doSubmit" class=[]/>
                </#if>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>