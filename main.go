package main

import (
	"fmt"
	"patrongg/data_providers"
	"patrongg/database"
	"patrongg/rest"
)

func main() {

	//Run async to get data from the overwatch api and insert into database
	go func() {
		heroes, err := data_providers.GetHeroesList()

		if err != nil {
			fmt.Println(err.Error())
			return
		}

		for _, value := range heroes {
			database.InsertHero(value)
		}

		fmt.Println("Successfully read and inserted heroes in local database")

		abilities, err := data_providers.GetAbilityList()

		if err != nil {
			fmt.Println(err.Error())
			return
		}

		for _, value := range abilities {
			database.InsertAbility(value)
		}

		fmt.Println("Successfully read and inserted abilities in local database")
	}()


	//Start the rest router
	go rest.Setup()

	fmt.Scanln()

}


