import Html exposing (..)

main =
  Html.program { model = model, update = update, view = view }

-- MODEL

type alias Model =
  { value : Int
  , suit : String
  , selected : Bool
  }


-- UPDATE

type Msg =
  Select

update : Msg -> Model -> Model
update msg model =
  case msg of
    Select ->
      selected = True


-- VIEW

view : Model -> Html Msg
view model =
  div []
  [
  ]