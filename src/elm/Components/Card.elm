module Components.Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

type alias Suit  = String
type alias Value = Int
type alias Card =
  { suit : Suit
  , value : Value
  }

-- card component
card : Suit -> Value -> Card
card suit value =
  Card suit value


type Msg
  = NoOp

update : Msg -> Card -> ( Card, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      (model, Cmd.none)


cardView : Card -> Html Msg
cardView card =
  div[]
  [
    div[]
    [
      text card.suit, text (toString card.value)
    ]
    , div[]
    [
      img [src ""][]
    ]
  ]