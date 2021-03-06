{include file="_usermessage.tpl"}

<div class="plugin-info">

    <span class="pull-right">{insert name="help_link" id='youtube'}</span>
    <h1>
        <img src="{$site_root_path}plugins/youtube/assets/img/youtube_icon.png" class="plugin-image">
        YouTube Plugin
    </h1>

    <p>The YouTube plugin collects videos, comments, likes, dislikes and view counts from YouTube for an authorized user.

</div>


{if $oauth_link}

{include file="_usermessage.tpl" field='authorization'}
<a href="{$oauth_link}" class="btn btn-success add-account"><i class="icon-plus icon-white"></i> Add a YouTube User</a>
{/if}

    {if count($owner_instances) > 0 }
    <h2>YouTube Accounts</h2>

    {include file="_usermessage.tpl" field='user_add'}

    {foreach from=$owner_instances key=iid item=i name=foo}
    <div class="row-fluid">
        <div class="span3">
            <a href="{$site_root_path}?u={$i->network_username|urlencode}&n={$i->network|urlencode}">{$i->network_username}</a>
        </div>
        <div class="span3">
            <span id="div{$i->id}"><input type="submit" name="submit" id="{$i->id}" class="btn {if $i->is_public}btnPriv{else}btnPub{/if}" value="Set {if $i->is_public}private{else}public{/if}" /></span>
        </div>
        {if $user_is_admin}
        <div class="span3">
            <span id="divactivate{$i->id}"><input type="submit" name="submit" id="{$i->id}" class="btn {if $i->is_active}btnPause{else}btnPlay{/if}" value="{if $i->is_active}Pause{else}Start{/if} crawling" /></span>
        </div>
        {/if}
        <div class="span3">
            <span id="delete{$i->id}"><form method="post" action="{$site_root_path}account/?p=google%2B#manage_plugin"><input type="hidden" name="instance_id" value="{$i->id}">
            {insert name="csrf_token"}<!-- delete account csrf token -->
            <input onClick="return confirm('Do you really want to delete this YouTube account from ThinkUp?');"  type="submit" name="action" class="btn btn-danger" value="Delete" /></form></span>
        </div>
    </div>
    {/foreach}
    <br />
    {/if}

<div id="contact-admin-div" style="display: none;">
{include file="_plugin.admin-request.tpl"}
</div>


{if $user_is_admin}
{include file="_plugin.showhider.tpl"}
{include file="_usermessage.tpl" field="setup"}
<p style="padding:5px">To set up the YouTube plugin:</p>
<ol style="margin-left:40px">
<li><a href="http://code.google.com/apis/console#access" target="_blank" style="text-decoration : underline;">Create a project in the Google APIs Console.</a></li>
<li>Click "Services" and switch the YouTube Analytics API, YouTube Data API v3 and Google Plus API to "On." Next, click "API Access" then "Create an OAuth 2.0 client ID."</li>
<li>
  Edit the settings for your new Client ID then click "Next." Make sure "Application Type" is set to "Web Application" and set the first line of Authorized Redirect URIs to<br>
    <small>
      <code style="font-family:Courier;" id="clippy_2988">{$thinkup_site_url}account/?p=youtube#manage_plugin</code>
    </small>
    <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="100"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="{$site_root_path}assets/flash/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=clippy_2988&amp;copied=copied!&amp;copyto=copy to clipboard">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="{$site_root_path}assets/flash/clippy.swf"
             width="100"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=clippy_2988&amp;copied=copied!&amp;copyto=copy to clipboard"
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
    </object>
</li>
<li>Enter the Google-provided Client ID and Client Secret here.</li></ol>
{/if}

Very active YouTube users might want to <a href="https://code.google.com/apis/youtube/dashboard/gwt/index.html#settings">obtain a developer key</a>, which will allow ThinkUp to collect data faster. Learn more <a href="https://www.thinkup.com/docs/userguide/settings/plugins/youtube.html"> here. </a>

{if $options_markup}
<p>
{$options_markup}
</p>
{/if}

{if $user_is_admin}</div>{/if}

{literal}
<script type="text/javascript">
if( required_values_set ) {
    $('#add-account-div').show();
} else {
    if(! is_admin) {
        $('#contact-admin-div').show();
    }
}
{/literal}
</script>


