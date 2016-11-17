module ViewEnterStory exposing (root)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import History.View as HistoryView
import Types exposing (..)
import ViewTitle as Title


root : Model -> Html Msg
root model =
    div []
        [ Title.root "Size new story"
        , Html.form [ onSubmit StartStorySizing ]
            [ input
                [ type' "text"
                , placeholder "Story name"
                , onInput StoryInput
                , value model.storyInput
                ]
                []
            , button [ type' "submit" ] [ text "Size" ]
            ]
        , history model
        ]


history : Model -> Html Msg
history model =
    App.map HistoryMsg (HistoryView.history model.hisotryModel)