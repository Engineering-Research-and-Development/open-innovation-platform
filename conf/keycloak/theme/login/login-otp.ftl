<#import "template.ftl" as layout>
<#import "field.ftl" as field>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('totp'); section>
<!-- template: login-otp.ftl -->

    <#if section="header">
        ${msg("doLogIn")}
    <#elseif section="form">
        <form id="kc-otp-login-form" action="${url.loginAction}" method="post">
            <input id="selectedCredentialId" type="hidden" name="selectedCredentialId" value="${otpLogin.selectedCredentialId!''}">
            <#if otpLogin.userOtpCredentials?size gt 1>
                <div class="flex flex-wrap items-center gap-2 mt-10 mb-5 text-gray-600">                
                    <#list otpLogin.userOtpCredentials as otpCredential>
                        <div id="kc-otp-credential-${otpCredential?index}" class="border flex flex-col items-center p-2 rounded-md cursor-pointer transition" onclick="toggleOTP(${otpCredential?index}, '${otpCredential.id}')">
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="w-10 h-10" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M12 17v4m-2-1l4-2m-4 0l4 2m-9-3v4m-2-1l4-2m-4 0l4 2m12-3v4m-2-1l4-2m-4 0l4 2M7 14V6a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v8m-6-9h2m-1 12v.01"/></svg>
                            </span>
                            <span>${otpCredential.userLabel}</span>
                        </div>
                    </#list>
                </div>
            </#if>

            <@field.input name="otp" label=msg("loginOtpOneTime") autocomplete="one-time-code" fieldName="totp" autofocus=true />

            <@buttons.loginButton />
        </form>
        <script>
            function toggleOTP(index, value) {
                // select the clicked OTP credential
                document.getElementById("selectedCredentialId").value = value;
                // remove selected class from all OTP credentials
                Array.from(document.getElementsByClassName("otp-device")).map(i => i.classList.remove("otp-device"));
                // add selected class to the clicked OTP credential
                document.getElementById("kc-otp-credential-" + index).classList.add("otp-device");
            }
        </script>
    </#if>
</@layout.registrationLayout>