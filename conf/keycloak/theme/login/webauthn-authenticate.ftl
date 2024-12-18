<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=(realm.registrationAllowed && !registrationDisabled??); section>
<!-- template: webauthn-autthenticate.ftl -->

    <#if section = "title">
     title
    <#elseif section = "header">
        ${kcSanitize(msg("webauthn-login-title"))?no_esc}
    <#elseif section = "form">
        <div id="kc-form-webauthn">
            <form id="webauth" action="${url.loginAction}" method="post">
                <input type="hidden" id="clientDataJSON" name="clientDataJSON"/>
                <input type="hidden" id="authenticatorData" name="authenticatorData"/>
                <input type="hidden" id="signature" name="signature"/>
                <input type="hidden" id="credentialId" name="credentialId"/>
                <input type="hidden" id="userHandle" name="userHandle"/>
                <input type="hidden" id="error" name="error"/>
            </form>

            <#if authenticators??>
                <form id="authn_select">
                    <#list authenticators.authenticators as authenticator>
                        <input type="hidden" name="authn_use_chk" value="${authenticator.credentialId}"/>
                    </#list>
                </form>
                <#if shouldDisplayAuthenticators?? && shouldDisplayAuthenticators>
                    <#if authenticators.authenticators?size gt 1>
                        <p class="text-lg font-semibold">${kcSanitize(msg("webauthn-available-authenticators"))?no_esc}</p>
                    </#if>

                    <ul role="list" class="flex flex-col gap-4 w-full my-4">
                        <#list authenticators.authenticators as authenticator>
                            <li id="kc-webauthn-authenticator-item-${authenticator?index}" class="ring-1 ring-brand-200 p-2 rounded-md">
                                <div id="kc-webauthn-authenticator-label-${authenticator?index}" class="font-medium inline-flex items-center gap-1">
                                    <div>
                                        <#switch authenticator.transports.iconClass>
                                            <#case "kcWebAuthnBLE">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" aria-hidden="true" viewBox="0 0 24 24"><path fill="currentColor" fill-rule="evenodd" d="m14.91 2.774l1.833 1.301c.54.384 1.012.719 1.341 1.034c.351.335.666.764.666 1.35c0 .584-.315 1.013-.666 1.349c-.33.315-.801.65-1.341 1.033L12.295 12l4.448 3.158c.54.383 1.012.718 1.341 1.034c.351.335.666.764.666 1.349s-.315 1.014-.666 1.35c-.33.314-.801.65-1.341 1.033l-1.833 1.302c-.73.518-1.345.955-1.856 1.216c-.52.265-1.156.465-1.79.14c-.638-.326-.845-.96-.93-1.536c-.084-.566-.084-1.319-.084-2.21V13.44l-3.82 2.674a.75.75 0 1 1-.86-1.229L9.692 12L5.57 9.114a.75.75 0 1 1 .86-1.229l3.82 2.674V5.163c0-.891 0-1.644.084-2.21c.085-.576.292-1.21.93-1.535c.634-.325 1.27-.126 1.79.14c.51.26 1.126.698 1.856 1.216m-3.16 10.678v5.323c0 .969.002 1.609.068 2.051c.031.214.071.327.1.383q.021.034.023.034l.005.003l.007.003q.002.002.044-.002c.064-.009.181-.043.375-.142c.4-.204.926-.575 1.72-1.138l1.737-1.234c.599-.425.978-.697 1.218-.927a1 1 0 0 0 .187-.22c.016-.029.016-.039.016-.044v-.002c0-.006 0-.016-.016-.044a1 1 0 0 0-.187-.22c-.24-.23-.62-.502-1.218-.927zm0-2.905V5.224c0-.969.002-1.609.068-2.05c.031-.215.071-.327.1-.384a.2.2 0 0 1 .023-.034l.005-.003l.007-.003a.2.2 0 0 1 .044.002c.064.01.181.043.375.142c.4.204.926.575 1.72 1.138l1.737 1.234c.599.425.978.697 1.218.927a1 1 0 0 1 .187.22c.016.029.016.039.016.044v.002c0 .006 0 .016-.016.045a1 1 0 0 1-.187.22c-.24.23-.62.501-1.218.926z" clip-rule="evenodd"/></svg>
                                                <#break>
                                            <#case "kcWebAuthnNFC">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" aria-hidden="true" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><rect width="7" height="12" x="2" y="6" rx="1"/><path d="M13 8.32a7.43 7.43 0 0 1 0 7.36m3.46-9.47a11.76 11.76 0 0 1 0 11.58M19.91 4.1a15.91 15.91 0 0 1 .01 15.8"/></g></svg>
                                                <#break>
                                            <#case "kcWebAuthnUSB">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" aria-hidden="true" viewBox="0 0 24 24"><path fill="currentColor" fill-rule="evenodd" d="M12 1.25a.75.75 0 0 1 .624.334l2 3a.75.75 0 1 1-1.248.832l-.626-.939v10.515q.182-.093.38-.16l3.265-1.088c.51-.17.855-.647.855-1.185v-1.85a1.2 1.2 0 0 1-.634-.325a1.24 1.24 0 0 1-.341-.735a5 5 0 0 1-.025-.615v-.068c0-.206 0-.427.025-.615c.03-.219.105-.5.341-.735c.236-.236.516-.312.735-.341c.188-.025.41-.025.615-.025h.068c.206 0 .427 0 .615.025c.219.03.5.105.735.341c.236.236.311.516.341.735c.025.188.025.41.025.615v.068c0 .206 0 .427-.025.615c-.03.219-.105.5-.341.735c-.2.2-.434.285-.634.324v1.85a2.75 2.75 0 0 1-1.88 2.61l-3.265 1.088a1.25 1.25 0 0 0-.852 1.098a2.751 2.751 0 1 1-1.503 0v-2.912a1.25 1.25 0 0 0-.855-1.186L7.13 12.167a2.75 2.75 0 0 1-1.88-2.609V7.582a1.75 1.75 0 1 1 1.5 0v1.976c0 .539.344 1.016.855 1.186l3.265 1.089q.198.066.38.159V4.477l-.626.939a.75.75 0 1 1-1.248-.832l2-3A.75.75 0 0 1 12 1.25m6 8l.249-.001L18.25 9l-.001-.249a16 16 0 0 0-.498 0L17.75 9l.001.249zM10.75 20a1.25 1.25 0 1 1 2.5 0a1.25 1.25 0 0 1-2.5 0M6 6.25a.25.25 0 1 0 0-.5a.25.25 0 0 0 0 .5" clip-rule="evenodd"/></svg>
                                                <#break>
                                            <#default>
                                                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" aria-hidden="true" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="M2.586 17.414A2 2 0 0 0 2 18.828V21a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h1a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h.172a2 2 0 0 0 1.414-.586l.814-.814a6.5 6.5 0 1 0-4-4z"/><circle cx="16.5" cy="7.5" r=".5" fill="currentColor"/></g></svg>
                                                <#break>
                                        </#switch>
                                    </div>
                                    <span>${kcSanitize(msg('${authenticator.label}'))?no_esc}</span>
                                </div>
                                <p class="text-xs text-gray-500">
                                    <span id="kc-webauthn-authenticator-createdlabel-${authenticator?index}">
                                        ${kcSanitize(msg('webauthn-createdAt-label'))?no_esc}
                                    </span>
                                    <span id="kc-webauthn-authenticator-created-${authenticator?index}">
                                        ${kcSanitize(authenticator.createdAt)?no_esc}
                                    </span>
                                </p>

                                <#if authenticator.transports?? && authenticator.transports.displayNameProperties?has_content>
                                    <div class="flex items-center justify-end gap-1" id="kc-webauthn-authenticator-transport-${authenticator?index}">
                                        <#list authenticator.transports.displayNameProperties as nameProperty>
                                            <span class="text-xs border border-brand-300 bg-brand-50 text-brand-800 px-2 py-0.5 rounded-md">${kcSanitize(msg('${nameProperty!}'))?no_esc}</span>
                                        </#list>
                                    </div>
                                </#if>    
                            </li>
                        </#list>
                    </div>
                </#if>
            </#if>

            <div id="kc-form-buttons" class="w-full flex items-center justify-end">
                <button id="authenticateWebAuthnButton" type="button" autofocus="autofocus"
                        value="${kcSanitize(msg("webauthn-doAuthenticate"))}"
                        class="px-8 py-2.5 focus:outline-none transition bg-brand-600 hover:bg-brand-500 text-white w-max float-right rounded-lg">
                        ${kcSanitize(msg("webauthn-doAuthenticate"))}
                </button>
            </div>
        </div>

        <script type="module">
            import { authenticateByWebAuthn } from "${url.resourcesPath}/js/webauthnAuthenticate.js";
            const authButton = document.getElementById('authenticateWebAuthnButton');
            authButton.addEventListener("click", function() {
                const input = {
                    isUserIdentified : ${isUserIdentified},
                    challenge : '${challenge}',
                    userVerification : '${userVerification}',
                    rpId : '${rpId}',
                    createTimeout : ${createTimeout},
                    errmsg : "${msg("webauthn-unsupported-browser-text")?no_esc}"
                };
                authenticateByWebAuthn(input);
            });
        </script>

    <#elseif section = "info">
        <#if realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container" class="text-gray-600 text-center mt-4">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a href="${url.registrationUrl}" class="text-brand-600">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
