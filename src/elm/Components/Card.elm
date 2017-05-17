module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { value : Int
    , suit : String
    , selected : Bool
    }


init : ( Model, Cmd Msg )
init =
    ( Model 2 "H" False, Cmd.none )



-- UPDATE


type Msg
    = Select


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Select ->
            ({ model | selected = True }, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [class "POOP"] [ img [ src (String.concat [ "../cards/", (String.concat [ (toString model.value), model.suit ]), ".svg" ]), width 50, height 100 ] [] ]
        ]
