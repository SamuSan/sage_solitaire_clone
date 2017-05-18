module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
--import Html.Events exposing ( onClick )

-- component import example
--import Components.Hello exposing ( hello )
--import Components.Card exposing ( .. )
--import Components.Card exposing ( cardView )


-- APP
main : Program Never Int Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model = Int

model : number
model =
  0


--CARD
type alias Card =
  { suit : String
  , value : Int
  }

card : String -> Int -> Card
card suit value =
  Card suit value

translateFaceCard : Int -> String
translateFaceCard value =
  case value of
    11 -> "J"
    12 -> "K"
    13 -> "Q"
    14 -> "A"
    _  -> ""

translateCardRank : Int -> String
translateCardRank value =
  if value < 11  then
    toString value
  else
    translateFaceCard value

imageName : Card -> String
imageName card =
  String.concat[ "static/img/cards/", (translateCardRank card.value), card.suit, ".svg" ]


-- UPDATE
type Msg = NoOp | Increment


update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    Increment -> model + 1


 --VIEW
 --Html is defined as: elem [ attribs ][ children ]
 --CSS can be applied via class names or inline style attrib
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
      img [src (imageName card)][]
    ]
  ]

--generateCards : List Card
--generateCards =
--  div[][]

view : Model -> Html Msg
view model =
  div [ class "container", style [("margin-top", "30px"), ( "text-align", "center" )] ]
    [    -- inline CSS (literal)
      cardView (card "H" 2)
    ]


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
