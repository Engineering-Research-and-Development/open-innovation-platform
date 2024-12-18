<#import "template.ftl" as layout>
<#import "field.ftl" as field>
<#import "buttons.ftl" as buttons>
<#import "password-commons.ftl" as passwordCommons>

<@layout.registrationLayout displayRequiredFields=false displayMessage=!messagesPerField.existsError('totp','userLabel'); section>
<!-- template: login-config-totp.ftl -->
    <#if section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "form">
        <ol id="kc-totp-settings" class="pl-4 flex flex-col gap-2 text-gray-800 list-disc">
            <li>
                <p>${msg("loginTotpStep1")}</p>

                <ul id="kc-totp-supported-apps" class="pl-2">
                    <#list totp.supportedApplications as app>
                        <li> - ${msg(app)}</li>
                    </#list>
                </ul>
            </li>

            <#if mode?? && mode = "manual">
                <li>
                    <p>${msg("loginTotpManualStep2")}</p>
                    <p><span id="kc-totp-secret-key" class="font-semibold">${totp.totpSecretEncoded}</span></p>
                    <p><a class="text-brand-500 hover:text-brand-600 transition font-semibold" href="${totp.qrUrl}" id="mode-barcode">${msg("loginTotpScanBarcode")}</a></p>
                </li>
                <li class="list-disc">
                    <p>${msg("loginTotpManualStep3")}</p>
                    
                    <ul class="mt-2">
                        <li id="kc-totp-type">${msg("loginTotpType")}: ${msg("loginTotp." + totp.policy.type)}</li>
                        <li id="kc-totp-algorithm">${msg("loginTotpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                        <li id="kc-totp-digits">${msg("loginTotpDigits")}: ${totp.policy.digits}</li>
                        <#if totp.policy.type = "totp">
                            <li id="kc-totp-period">${msg("loginTotpInterval")}: ${totp.policy.period}</li>
                        <#elseif totp.policy.type = "hotp">
                            <li id="kc-totp-counter">${msg("loginTotpCounter")}: ${totp.policy.initialCounter}</li>
                        </#if>
                    </ul>
                </li>
            <#else>
                <li>
                    <p>${msg("loginTotpStep2")}</p>
                    <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
                    <p><a class="text-brand-500 hover:text-brand-600 transition font-semibold" href="${totp.manualUrl}" id="mode-manual">${msg("loginTotpUnableToScan")}</a></p>
                </li>
            </#if>
            <li>
                <p>${msg("loginTotpStep3")}</p>
                <p>${msg("loginTotpStep3DeviceName")}</p>
            </li>
        </ol>

        <form action="${url.loginAction}" class="mt-3" id="kc-totp-settings-form" method="post" novalidate="novalidate">
            <div id="inp-device-name">
                <div class="mb-2">
                    <label for="form-vertical-name">
                        <span class="text-gray-700 text-sm">${msg("loginTotpDeviceName")}</span><#if totp.otpCredentials?size gte 1>&nbsp;<span class="pf-v5-c-form__label-required" aria-hidden="true">&#42;</span></#if>
                    </label>
                </div>
                <input type="text" id="userLabel" name="userLabel" autocomplete="off"
                        aria-invalid="<#if messagesPerField.existsError('userLabel')>true</#if>"
                        dir="ltr"
                        class="px-4 py-2.5 bg-white text-gray-800 rounded-lg border border-gray-300 focus:outline-none focus:border-brand-300 focus:border-dashed focus:ring-1 focus:ring-offset-2 focus:ring-brand-500 w-full"
                />
                <#if messagesPerField.existsError('userLabel')>
                    <div class="inline-flex item-center space-x-2 mt-1 text-sm">
                        <@field.errorIcon error=kcSanitize(messagesPerField.get('userLabel'))?no_esc/>
                        <span id="input-error-otp-label" class="text-gray-700" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('userLabel'))?no_esc}
                        </span>
                    </div>
                </#if>
            </div>
            <div id="inp-otp-code" class="mt-3">
                <div class="mb-2">
                    <label for="form-vertical-name">
                        <span class="text-gray-700 text-sm">${msg("authenticatorCode")}</span>&nbsp;<span class="pf-v5-c-form__label-required" aria-hidden="true">&#42;</span>
                    </label>
                </div>
                <div class="<#if messagesPerField.existsError('totp')>text-red-600</#if>">
                    <input type="text" required id="totp" name="totp" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>"
                           dir="ltr"
                           class="px-4 py-2.5 bg-white text-gray-800 rounded-lg border border-gray-300 focus:outline-none focus:border-brand-300 focus:border-dashed focus:ring-1 focus:ring-offset-2 focus:ring-brand-500 w-full"
                    />
                </div>
                <#if messagesPerField.existsError('totp')>
                    <div class="inline-flex item-center space-x-2 mt-1 text-sm">
                        <span id="input-error-otp-code" class="text-red-600" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                        </span>
                    </div>
                </#if>
                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                <#if mode??><input type="hidden" id="mode" name="mode" value="${mode}"/></#if>
            </div>
            <@passwordCommons.logoutOtherSessions/>

            <div class="flex items-center justify-end gap-4 mt-4">
                <#if isAppInitiatedAction??>
                    <@buttons.buttonOutline id="cancelTOTPBtn" name="cancel-aia" label="doCancel" class=[]/>
                    <@buttons.button id="saveTOTPBtn" label="doSubmit" class=[]/>
                <#else>
                    <@buttons.button id="saveTOTPBtn" label="doSubmit" class=[]/>
                </#if>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
