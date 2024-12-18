<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<#import "field.ftl" as field>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
<!-- template: login-update-password.ftl -->
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <form id="kc-passwd-update-form" action="${url.loginAction}" method="post" novalidate="novalidate">
            <div class="flex flex-col gap-4">
                <@field.password name="password-new" label=msg("passwordNew") fieldName="password" autocomplete="new-password" autofocus=true />
                <@field.password name="password-confirm" label=msg("passwordConfirm") autocomplete="new-password" />
            </div>
            <div class="mt-5">
                <@passwordCommons.logoutOtherSessions/>
            </div>

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
