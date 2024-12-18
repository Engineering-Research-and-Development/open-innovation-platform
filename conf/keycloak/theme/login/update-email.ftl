<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        ${msg("updateEmailTitle")}
    <#elseif section = "form">
        <form id="kc-update-email-form" action="${url.loginAction}" method="post">
            <@userProfileCommons.userProfileFormFields/>
            
            <div id="kc-form-options">
                <div></div>
            </div>

            <@passwordCommons.logoutOtherSessions/>

            <@buttons.actionGroup>
                <#if isAppInitiatedAction??>
                    <@buttons.buttonOutline label="doCancel" id="btn-cancel-act" name="cancel-aia" class=[]/>
                    <@buttons.button label="doSubmit" id="btn-submit-act" class=[]/>
                <#else>
                    <@buttons.button label="doSubmit" id="btn-submit" class=[]/>
                </#if>
            </@buttons.actionGroup>
        </form>
    </#if>
</@layout.registrationLayout>
