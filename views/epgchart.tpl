%include ('create.tpl')
<div id="delta_before_epg" delta="{{deltab}}"></div>
<div id="delta_after_epg" delta="{{deltaa}}"></div>
<div id="users-contain" class="">
    <div id="chartheader">
        <!--<h1>§Electronic Program Guide§</h1>-->
        <div>
            <!--<div id="label_epg_1">§Current date§:</div>-->
            <button id="date_prev"><</button>
            <input type="text" maxlength="10" id="datepicker_epg" class="" name="datepicker_epg" dbvalue="{{curr}}"/>
            <button id="date_next">></button>
        </div>
        <div>
            <!--<div id="label_epg_2">§Keyword§:</div>-->
            <input type="text" maxlength="50" id="searchepg" class="" name="searchepg" value="" placeholder="§Keyword§"/>
            <button id="searchepgbutton">§Highlight§</button>
        </div>
        <div id="zoom_info">
            <!--<div class="lefty">§Zoom:§</div>-->
            <div id="slider_zoom"></div>
            <input type="text" zoom="{{zoom}}" id="zoom_amount" readonly class="" style="border:0; font-weight:bold;">
            <!--<button id="flipepg">§Flip chart§</button>-->
        </div>
        <div>
            <button id="grabepg">§Import EPG§</button>
        </div>
    </div>
    <div id="chartbody">


<div id="channelscroll1">


<div id="channelnames">
%cnt=0
%for rows in rowss:

    %if len(rows)>0:
        %if rows[0][0] == -1:
<div class="channeltime" cnt="{{cnt}}">
        %else:
<div class="channelname" cnt="{{cnt}}">
    <div class="channelnametext"><a href="live/{{rows[0][0]}}.m3u">{{rows[0][8]}}</a></div>
    <div class="channeldelete"><label title="Disable channel" id="iconsDisable-{{rows[0][0]}}" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-close"></span></label></div>
        %end
</div>
        %cnt=cnt+1
    %end

%end
<div class="whitespace"></div>
</div>


<div id="channelscroll2">
<div id="channelscroll3">


<div id="channeltimes" style="width: {{len(rowss[0])*200}}px">

    <div id="channelgroup" cnt="{{cnt}}">
    %for row in rowss[0]:
        <div class="channeltime" id="event" cnt="{{cnt}}" cid="{{row[0]}}" x="{{row[1]}}" at="{{row[4]}}" till="{{row[5]}}" fulltext="{{row[6]}}" rid="{{row[7]}}" recording="{{row[9]}}" style="width: calc( {{row[2]}}% - 5px );">{{row[3]}}</div>
    %end
    <div class="whitespace"></div>
    </div>

</div>


</div>
<div id="channelscroll4">


<div id="nowbar" style=""></div>
<div id="channeldata" style="width: {{len(rowss[0])*200}}px">
%cnt=0
%for rows in rowss:

    <div id="channelgroup" cnt="{{cnt}}">
    %for row in rows:
        %if cnt!=0:
            %if row[7] != -1:
            <div class="channelentry" id="event" cnt="{{cnt}}" cid="{{row[0]}}" x="{{row[1]}}" at="{{row[4]}}" till="{{row[5]}}" fulltext="{{row[6]}}" rid="{{row[7]}}" recording="{{row[9]}}" rec="{{row[10]}}" style="width: calc( {{row[2]}}% - 5px );">{{row[3]}}</div>
            %else:
            <div class="whitespace" cnt="{{cnt}}" cid="{{row[0]}}" x="{{row[1]}}" at="{{row[4]}}" till="{{row[5]}}" rid="{{row[7]}}" recording="{{row[9]}}" rec="{{row[10]}}" style="width: calc( {{row[2]}}% - 5px );"></div>
            %end
        %end
    %end
    </div>
    %cnt=cnt+1

%end
</div>


</div>


</div>


</div>


    </div>
</div>

<div id="dialog_record_from_epg" title="§Detail view§" record="§Record§" tunerecord="§Edit&Record§" cancel="§Cancel§">
    <div id="dialog_content">
        <!-- Empty -->
    </div>
</div>
<div id="dialog_remove" title="§Confirmation request§" cancel="§Cancel§" delete="§Delete§">
	<p>§Shall I delete this record?§</p>
</div>
<form>
    <input type="text" style="display: none;" name="ret" id="ret" value="X"/>
</form>
<div id="dialog_channel_disable" title="§Channel disable§" disable="§Disable§" cancel="§Cancel§">
	<p>§Do you want to disable this channel? You can enable it again at the channel list page.§</p>
</div>
