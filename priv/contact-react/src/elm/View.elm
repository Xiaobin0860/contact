module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (model.roomId |> Maybe.withDefault "999") ]
        , div [ class "message-log" ]
            (List.map renderMessage model.messages)
        ]


renderMessage : Message -> Html Msg
renderMessage message =
    div [ class "message row" ]
        [ div [ class "sender col-xs-12 col-sm-4 col-md-3" ] [ text "sender" ]
        , div [ class "body col-xs-12 col-sm-8 col-md-9" ] [ text message.body ]
        ]
