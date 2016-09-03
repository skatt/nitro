-module(element_checkbox).
-author('Rusty Klophaus, Vladimir Galunshchikov').
-include_lib("nitro/include/nitro.hrl").
-compile(export_all).

render_element(Record) -> 
    Id = case Record#checkbox.id of undefined -> nitro:temp_id(); I->I end,
    case Record#checkbox.postback of
        undefined -> ignore;
        Postback -> nitro:wire(#event { type=change, postback=Postback, target=Id, source=Record#checkbox.source, delegate=Record#checkbox.delegate })
    end,
   wf_tags:emit_tag(<<"input">>, [], [
      % global
      {<<"accesskey">>, Record#checkbox.accesskey},
      {<<"class">>, Record#checkbox.class},
      {<<"contenteditable">>, case Record#checkbox.contenteditable of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"contextmenu">>, Record#checkbox.contextmenu},
      {<<"dir">>, case Record#checkbox.dir of "ltr" -> "ltr"; "rtl" -> "rtl"; "auto" -> "auto"; _ -> undefined end},
      {<<"draggable">>, case Record#checkbox.draggable of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"dropzone">>, Record#checkbox.dropzone},
      {<<"hidden">>, case Record#checkbox.hidden of "hidden" -> "hidden"; _ -> undefined end},
      {<<"id">>, Id},
      {<<"lang">>, Record#checkbox.lang},
      {<<"spellcheck">>, case Record#checkbox.spellcheck of true -> "true"; false -> "false"; _ -> undefined end},
      {<<"style">>, Record#checkbox.style},
      {<<"tabindex">>, Record#checkbox.tabindex},
      {<<"title">>, Record#checkbox.title},
      {<<"translate">>, case Record#checkbox.contenteditable of "yes" -> "yes"; "no" -> "no"; _ -> undefined end},      
      % spec
      {<<"autofocus">>,Record#checkbox.autofocus},
      {<<"checked">>, if Record#checkbox.checked==true -> <<"checked">>; _ -> undefined end},
      {<<"data-toggle">>, <<"checkbox">>},
      {<<"disabled">>, if Record#checkbox.disabled == true -> "disabled"; _ -> undefined end},
      {<<"form">>, Record#checkbox.form},
      {<<"name">>, Record#checkbox.name},            
      {<<"required">>, if Record#checkbox.required == true -> "required"; _ -> undefined end},
      {<<"type">>, <<"checkbox">>},
      {<<"value">>, Record#checkbox.value} | Record#checkbox.data_fields
      ]).
%,
%      case Record#checkbox.body of undefined -> []; B -> B end ],
%    wf_tags:emit_tag(<<"label">>, nitro:render(Label), [
%        {<<"class">>, Record#checkbox.class},
%        {<<"style">>, Record#checkbox.style},
%        {<<"for">>, Id} ]).