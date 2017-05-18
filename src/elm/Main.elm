module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
--import Html.Events exposing ( onClick )

-- APP
main : Program Never Int Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model = Int

model : number
model =
  0

type alias Deck =
  {
    cards : List Card
  }

deck : List Card -> Deck
deck cards =
  Deck cards


--CARD
type alias Card =
  { suit : String
  , value : Int
  }

card : String -> Int -> Card
card suit value =
  Card suit value

cards : List Card
cards =
  List.concat (List.map generateCards ["H", "A", "S", "D"])

generateCards : String -> List Card
generateCards suit =
  List.map2 Card (List.repeat 14 suit)(List.range 2 14)

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



cardView : Card -> Html Msg
cardView card =
    div[]
    [
      img [src (imageName card)][]
    ]

view : Model -> Html Msg
view model =
  div [ class ""] (List.map cardView cards)

-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }
