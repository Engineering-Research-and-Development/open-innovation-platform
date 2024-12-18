<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout; section>
<!-- template: login-recovery-authn-code-config.ftl -->
<#if section = "header">
    ${msg("recovery-code-config-header")}
<#elseif section = "form">
    <!-- warning -->
    <div class="p-4 my-4 rounded-lg shadow-2xl shadow-yellow-600/20 gap-2 text-yellow-800 border border-yellow-300 bg-yellow-50" aria-label="Warning alert">
        <p class="inline-flex items-center gap-2">
            <span class="text-yellow-500">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" aria-hidden="true" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M12.884 2.532c-.346-.654-1.422-.654-1.768 0l-9 17A1 1 0 0 0 3 21h18a.998.998 0 0 0 .883-1.467zM13 18h-2v-2h2zm-2-4V9h2l.001 5z"/>
                </svg>
            </span>
            <span class="pf-screen-reader">Warning alert</span>
        </p>
        <div class="text-sm">
            <p class="mb-2 font-medium">${msg("recovery-code-config-warning-title")}</p>
            <p>${msg("recovery-code-config-warning-message")}</p>
        </div>
    </div>

    <div class="text-sm md:text-base my-4">
        <ol id="kc-recovery-codes-list" class="ml-4 font-medium grid grid-cols-2 list-decimal" role="list">
            <div class="space-y-1.5">
                <#list recoveryAuthnCodesConfigBean.generatedRecoveryAuthnCodesList as code>
                    <#if (code?counter<7)>
                        <li>${code[0..3]}-${code[4..7]}-${code[8..]}</li>
                    </#if>
                </#list>
            </div>
            <div class="space-y-1.5">
                <#list recoveryAuthnCodesConfigBean.generatedRecoveryAuthnCodesList as code>
                    <#if (code?counter>6)>
                        <li>${code[0..3]}-${code[4..7]}-${code[8..]}</li>
                    </#if>
                </#list>
            </div>
        </ol>
    </div>

    <!-- actions -->
    <div class="my-10 flex items-center gap-4">
        <button id="printRecoveryCodes" class="inline-flex text-sm items-center gap-2 ring-1 py-0.5 px-2 rounded-md text-brand-600 ring-brand-600 hover:bg-brand-50" type="button" onclick="printRecoveryCodes()">
            <span>
                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="w-4 h-4" viewBox="0 0 24 24"><path fill="currentColor" fill-rule="evenodd" d="M11.945 1.25h.11c1.367 0 2.47 0 3.337.117c.9.12 1.658.38 2.26.981c.74.74.968 1.727 1.05 2.951q.366.025.69.068c.9.12 1.658.38 2.26.981c.602.602.86 1.36.982 2.26c.116.867.116 1.97.116 3.337v.11c0 1.367 0 2.47-.116 3.337c-.122.9-.38 1.658-.982 2.26c-.74.74-1.727.968-2.951 1.05q-.024.366-.067.69c-.122.9-.38 1.658-.982 2.26s-1.36.86-2.26.982c-.867.116-1.97.116-3.337.116h-.11c-1.367 0-2.47 0-3.337-.116c-.9-.122-1.658-.38-2.26-.982s-.86-1.36-.981-2.26q-.044-.324-.068-.69c-1.224-.082-2.21-.31-2.95-1.05c-.603-.602-.861-1.36-.982-2.26c-.117-.867-.117-1.97-.117-3.337v-.11c0-1.367 0-2.47.117-3.337c.12-.9.38-1.658.981-2.26c.602-.602 1.36-.86 2.26-.981a10 10 0 0 1 .69-.068c.082-1.224.31-2.21 1.05-2.95c.602-.603 1.36-.861 2.26-.982c.867-.117 1.97-.117 3.337-.117M6.807 5.253q.535-.004 1.138-.003h8.11q.602 0 1.138.003c-.082-1.02-.267-1.508-.602-1.844c-.277-.277-.665-.457-1.4-.556c-.755-.101-1.756-.103-3.191-.103s-2.437.002-3.192.103c-.734.099-1.122.28-1.399.556c-.335.336-.52.823-.602 1.844m-1.554 11.94q-.004-.535-.003-1.138v-3.117q-.232.094-.443.19a.75.75 0 1 1-.614-1.37C5.915 10.987 8.48 10.25 12 10.25s6.085.736 7.807 1.509a.75.75 0 1 1-.614 1.368q-.21-.095-.443-.189v3.117q0 .602-.003 1.138c1.02-.082 1.509-.267 1.844-.602c.277-.277.457-.665.556-1.4c.101-.755.103-1.756.103-3.191s-.002-2.437-.103-3.192c-.099-.734-.28-1.122-.556-1.399c-.277-.277-.665-.457-1.4-.556c-.755-.101-1.756-.103-3.191-.103H8c-1.435 0-2.437.002-3.192.103c-.734.099-1.122.28-1.399.556c-.277.277-.457.665-.556 1.4c-.101.754-.103 1.756-.103 3.191s.002 2.437.103 3.192c.099.734.28 1.122.556 1.399c.336.335.823.52 1.844.602m11.997-4.766c-1.377-.39-3.116-.677-5.25-.677s-3.873.288-5.25.677V16c0 1.435.002 2.436.103 3.192c.099.734.28 1.122.556 1.399c.277.277.665.457 1.4.556c.754.101 1.756.103 3.191.103s2.437-.002 3.192-.103c.734-.099 1.122-.28 1.399-.556c.277-.277.457-.665.556-1.4c.101-.755.103-1.756.103-3.191z" clip-rule="evenodd"/></svg>
            </span>
             <span>${msg("recovery-codes-print")}</span>
        </button>
        <button id="downloadRecoveryCodes" class="inline-flex text-sm items-center gap-2 ring-1 py-0.5 px-2 rounded-md text-brand-600 ring-brand-600 hover:bg-brand-50" type="button" onclick="downloadRecoveryCodes()">
            <span>
                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="w-4 h-4" viewBox="0 0 24 24"><path fill="currentColor" d="M12.554 16.506a.75.75 0 0 1-1.107 0l-4-4.375a.75.75 0 0 1 1.107-1.012l2.696 2.95V3a.75.75 0 0 1 1.5 0v11.068l2.697-2.95a.75.75 0 1 1 1.107 1.013z"/><path fill="currentColor" d="M3.75 15a.75.75 0 0 0-1.5 0v.055c0 1.367 0 2.47.117 3.337c.12.9.38 1.658.981 2.26c.602.602 1.36.86 2.26.982c.867.116 1.97.116 3.337.116h6.11c1.367 0 2.47 0 3.337-.116c.9-.122 1.658-.38 2.26-.982s.86-1.36.982-2.26c.116-.867.116-1.97.116-3.337V15a.75.75 0 0 0-1.5 0c0 1.435-.002 2.436-.103 3.192c-.099.734-.28 1.122-.556 1.399c-.277.277-.665.457-1.4.556c-.755.101-1.756.103-3.191.103H9c-1.435 0-2.437-.002-3.192-.103c-.734-.099-1.122-.28-1.399-.556c-.277-.277-.457-.665-.556-1.4c-.101-.755-.103-1.756-.103-3.191"/></svg>
            </span>
             <span>${msg("recovery-codes-download")}</span>
        </button>
        <button id="copyRecoveryCodes" class="inline-flex text-sm items-center gap-2 ring-1 py-0.5 px-2 rounded-md text-brand-600 ring-brand-600 hover:bg-brand-50" type="button" onclick="copyRecoveryCodes()">
            <span>
                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="w-4 h-4" viewBox="0 0 24 24"><path fill="currentColor" fill-rule="evenodd" d="M15 1.25h-4.056c-1.838 0-3.294 0-4.433.153c-1.172.158-2.121.49-2.87 1.238c-.748.749-1.08 1.698-1.238 2.87c-.153 1.14-.153 2.595-.153 4.433V16a3.75 3.75 0 0 0 3.166 3.705c.137.764.402 1.416.932 1.947c.602.602 1.36.86 2.26.982c.867.116 1.97.116 3.337.116h3.11c1.367 0 2.47 0 3.337-.116c.9-.122 1.658-.38 2.26-.982s.86-1.36.982-2.26c.116-.867.116-1.97.116-3.337v-5.11c0-1.367 0-2.47-.116-3.337c-.122-.9-.38-1.658-.982-2.26c-.531-.53-1.183-.795-1.947-.932A3.75 3.75 0 0 0 15 1.25m2.13 3.021A2.25 2.25 0 0 0 15 2.75h-4c-1.907 0-3.261.002-4.29.14c-1.005.135-1.585.389-2.008.812S4.025 4.705 3.89 5.71c-.138 1.029-.14 2.383-.14 4.29v6a2.25 2.25 0 0 0 1.521 2.13c-.021-.61-.021-1.3-.021-2.075v-5.11c0-1.367 0-2.47.117-3.337c.12-.9.38-1.658.981-2.26c.602-.602 1.36-.86 2.26-.981c.867-.117 1.97-.117 3.337-.117h3.11c.775 0 1.464 0 2.074.021M7.408 6.41c.277-.277.665-.457 1.4-.556c.754-.101 1.756-.103 3.191-.103h3c1.435 0 2.436.002 3.192.103c.734.099 1.122.28 1.399.556c.277.277.457.665.556 1.4c.101.754.103 1.756.103 3.191v5c0 1.435-.002 2.436-.103 3.192c-.099.734-.28 1.122-.556 1.399c-.277.277-.665.457-1.4.556c-.755.101-1.756.103-3.191.103h-3c-1.435 0-2.437-.002-3.192-.103c-.734-.099-1.122-.28-1.399-.556c-.277-.277-.457-.665-.556-1.4c-.101-.755-.103-1.756-.103-3.191v-5c0-1.435.002-2.437.103-3.192c.099-.734.28-1.122.556-1.399" clip-rule="evenodd"/></svg>
            </span>
             <span>${msg("recovery-codes-copy")}</span>
        </button>
    </div>

    <!-- confirmation checkbox -->
    <div>
        <input 
            class="rounded mb-1 focus:outline-none outline-none border border-brand-400 text-brand-600 ring-1 ring-brand-300/25 focus:ring-brand-300"
            type="checkbox" id="kcRecoveryCodesConfirmationCheck" 
            name="kcRecoveryCodesConfirmationCheck"
            onchange="document.getElementById('saveRecoveryAuthnCodesBtn').disabled = !this.checked;"
        />
        <label for="kcRecoveryCodesConfirmationCheck">${msg("recovery-codes-confirmation-message")}</label>
    </div>

    <form action="${url.loginAction}" id="kc-recovery-codes-settings-form" method="post">
        <input type="hidden" name="generatedRecoveryAuthnCodes" value="${recoveryAuthnCodesConfigBean.generatedRecoveryAuthnCodesAsString}" />
        <input type="hidden" name="generatedAt" value="${recoveryAuthnCodesConfigBean.generatedAt?c}" />
        <input type="hidden" id="userLabel" name="userLabel" value="${msg("recovery-codes-label-default")}" />
        <@passwordCommons.logoutOtherSessions/>
        
        <div class="mt-6 flex flex-wrap items-center justify-end gap-4 w-full">
            <#if isAppInitiatedAction??>
                <button type="submit"
                    class="px-8 py-2.5 transition rounded-lg border-2 hover:bg-brand-50 border-brand-400 text-center text-brand-600 w-full md:w-max"
                    id="cancelRecoveryAuthnCodesBtn" name="cancel-aia" value="true">${msg("recovery-codes-action-cancel")}
                </button>
                <input type="submit"
                    class="px-8 py-2.5 cursor-pointer transition disabled:cursor-default disabled:bg-brand-400 bg-brand-600 hover:bg-brand-500 text-white w-full md:w-max rounded-lg"
                    id="saveRecoveryAuthnCodesBtn" value="${msg("recovery-codes-action-complete")}"
                    disabled
                />
            <#else>
                <input type="submit"
                    class="px-8 py-2.5 cursor-pointer transition disabled:cursor-default disabled:bg-brand-400 bg-brand-600 hover:bg-brand-500 text-white w-full md:w-max rounded-lg"
                    id="saveRecoveryAuthnCodesBtn" value="${msg("recovery-codes-action-complete")}"
                    disabled
                />
            </#if>
        </div>
    </form>

    <script>
        /* copy recovery codes  */
        function copyRecoveryCodes() {
            const tmpTextarea = document.createElement("textarea");
            tmpTextarea.innerHTML = parseRecoveryCodeList();
            document.body.appendChild(tmpTextarea);
            tmpTextarea.select();
            document.execCommand("copy");
            document.body.removeChild(tmpTextarea);
        }

        /* download recovery codes  */
        function formatCurrentDateTime() {
            const dt = new Date();
            const options = {
                month: 'long',
                day: 'numeric',
                year: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                timeZoneName: 'short'
            };

            return dt.toLocaleString('en-US', options);
        }

        function parseRecoveryCodeList() {
            const recoveryCodes = document.getElementById("kc-recovery-codes-list").getElementsByTagName("li");
            let recoveryCodeList = "";

            for (let i = 0; i < recoveryCodes.length; i++) {
                const recoveryCodeLiElement = recoveryCodes[i].innerText;
                <#noparse>
                recoveryCodeList += `${i + 1}. ${recoveryCodeLiElement}\r\n`;
                </#noparse>
            }

            return recoveryCodeList;
        }

        function buildDownloadContent() {
            const recoveryCodeList = parseRecoveryCodeList();
            const dt = new Date();
            const options = {
                month: 'long',
                day: 'numeric',
                year: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                timeZoneName: 'short'
            };

            return fileBodyContent =
                "${msg("recovery-codes-download-file-header")}\n\n" +
                recoveryCodeList + "\n" +
                "${msg("recovery-codes-download-file-description")}\n\n" +
                "${msg("recovery-codes-download-file-date")} " + formatCurrentDateTime();
        }

        function setUpDownloadLinkAndDownload(filename, text) {
            const el = document.createElement('a');
            el.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
            el.setAttribute('download', filename);
            el.style.display = 'none';
            document.body.appendChild(el);
            el.click();
            document.body.removeChild(el);
        }

        function downloadRecoveryCodes() {
            setUpDownloadLinkAndDownload('kc-download-recovery-codes.txt', buildDownloadContent());
        }

        /* print recovery codes */
        function buildPrintContent() {
            const recoveryCodeListHTML = document.getElementById('kc-recovery-codes-list').parentNode.innerHTML;
            const styles =
                `@page { size: auto;  margin-top: 0; }
                body { width: 480px; }
                div { font-family: monospace }
                p:first-of-type { margin-top: 48px }`;

            return printFileContent =
                "<html><style>" + styles + "</style><body>" +
                "<title>kc-download-recovery-codes</title>" +
                "<p>${msg("recovery-codes-download-file-header")}</p>" +
                "<div>" + recoveryCodeListHTML + "</div>" +
                "<p>${msg("recovery-codes-download-file-description")}</p>" +
                "<p>${msg("recovery-codes-download-file-date")} " + formatCurrentDateTime() + "</p>" +
                "</body></html>";
        }

        function printRecoveryCodes() {
            const w = window.open();
            w.document.write(buildPrintContent());
            w.print();
            w.close();
        }
    </script>
</#if>
</@layout.registrationLayout>
