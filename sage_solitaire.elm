import Html exposing (..)


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
    Reset ->
      ...


-- VIEW

view : Model -> Html Msg
view model =
  ...