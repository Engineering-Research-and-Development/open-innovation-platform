<#macro logoutOtherSessions>
    <div id="kc-form-options" class="mt-3">
        <div>
            <input 
                class="rounded mb-0.5 focus:outline-none outline-none border border-brand-400 text-brand-600 ring-1 ring-brand-300/25 focus:ring-brand-300"
                type="checkbox" 
                id="logout-sessions" 
                name="logout-sessions" 
                value="on" 
                checked
            >
            <label class="text-gray-800 ml-2" for="logout-sessions">
                ${msg("logoutOtherSessions")}
            </label>
        </div>
    </div>
</#macro>
