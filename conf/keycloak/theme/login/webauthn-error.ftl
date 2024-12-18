<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true; section>
    <#if section = "header">
        ${kcSanitize(msg("webauthn-error-title"))?no_esc}
    <#elseif section = "form">

        <script type="text/javascript">
            refreshPage = () => {
                document.getElementById('isSetRetry').value = 'retry';
                document.getElementById('executionValue').value = '${execution}';
                document.getElementById('kc-error-credential-form').submit();
            }
        </script>

        <form id="kc-error-credential-form" action="${url.loginAction}" method="post">
            <input type="hidden" id="executionValue" name="authenticationExecution"/>
            <input type="hidden" id="isSetRetry" name="isSetRetry"/>
        </form>

        <div class="w-full flex items-center justify-end gap-4">
            <#if isAppInitiatedAction??>
                <form action="${url.loginAction}" id="kc-webauthn-settings-form" method="post">
                    <button 
                        type="submit"
                        class="px-8 py-2.5 transition rounded-lg border-2 hover:bg-brand-50 border-brand-400 text-center text-brand-600 w-max"
                        id="cancelWebAuthnAIA" name="cancel-aia" value="true">
                            ${msg("doCancel")}
                    </button>
                </form>
            </#if>
            <input tabindex="4" onclick="refreshPage()" type="button"
                   class="px-8 py-2.5 transition bg-brand-600 hover:bg-brand-500 text-white w-max rounded-lg"
                   name="try-again" id="kc-try-again" value="${kcSanitize(msg("doTryAgain"))?no_esc}"
            />
        </div>

    </#if>
</@layout.registrationLayout>