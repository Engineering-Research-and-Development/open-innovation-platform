<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('totp'); section>
    <#if section="header">
        ${msg("doLogIn")}
    <#elseif section="form">
        <form id="kc-otp-reset-form" action="${url.loginAction}" method="post">
            <p id="kc-otp-reset-form-description" class="font-medium mb-4">${msg("otp-reset-description")}</p>

            <#list configuredOtpCredentials.userOtpCredentials as otpCredential>
                <div class="flex items-center gap-2">
                    <input id="kc-otp-credential-${otpCredential?index}" class="text-brand-600 focus:outline-none focus:ring-2 focus:ring-brand-500" type="radio" name="selectedCredentialId" value="${otpCredential.id}" <#if otpCredential.id == configuredOtpCredentials.selectedCredentialId>checked="checked"</#if>>
                    <label for="kc-otp-credential-${otpCredential?index}" class="lg:cursor-pointer" tabindex="${otpCredential?index}">
                        <span> ${otpCredential.userLabel}</span>
                    </label>
                </div>
            </#list>

            <div id="kc-form-buttons" class="mt-4 flex items-center justify-end">
                <@buttons.button name="kc-otp-reset-form-submit" id="kc-otp-reset-form-submit" label="doSubmit" />
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
