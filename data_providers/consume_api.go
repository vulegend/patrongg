package data_providers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"patrongg/models"
)

//Callback struct for marshaling heroes json
type heroesResponse struct {
	Heroes []models.Hero `json:"data"`
}

//Retrieves the hero list from the overwatch-api.net
func GetHeroesList() ([]models.Hero, error) {
	resp, err := http.Get("https://overwatch-api.net/api/v1/hero/")

	if err != nil {
		return nil, err
	}

	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)

	if err != nil {
		return nil, err
	}

	parsedResponse := heroesResponse{}
	err = json.Unmarshal([]byte(body), &parsedResponse)

	if err != nil {
		return nil, err
	}

	return parsedResponse.Heroes, nil
}


type abilitiesResponse struct {
	Next *string `json:"next"`
	Abilities []models.Ability `json:"data"`
}

func GetAbilityList() ([]models.Ability, error) {

	resp, err := http.Get("https://overwatch-api.net/api/v1/ability/")

	if err != nil {
		return nil, err
	}

	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)

	if err != nil {
		return nil, err
	}

	var toReturn []models.Ability
	parsedResponse := abilitiesResponse{}
	err = json.Unmarshal([]byte(body), &parsedResponse)

	if err != nil {
		return nil, err
	}

	for parsedResponse.Next != nil {
		toReturn = append(toReturn, parsedResponse.Abilities ...)
		fmt.Println(*parsedResponse.Next)

		next, err := http.Get(*parsedResponse.Next)

		if err != nil {
			return nil, err
		}

		nextBody, err := ioutil.ReadAll(next.Body)

		if err != nil {
			return nil, err
		}

		parsedResponse = abilitiesResponse{}
		err = json.Unmarshal([]byte(nextBody), &parsedResponse)

		if err != nil {
			return nil, err
		}

		err = next.Body.Close()

		if err != nil {
			return nil, err
		}
	}

	return toReturn, nil
}