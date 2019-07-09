package database

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"patrongg/models"
)

func GetAllAbilities() ([]models.GetAllAbilitiesResponse, error) {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/patrongg")

	if err != nil {
		return nil, err
	}

	defer db.Close()

	rows, err := db.Query("SELECT id,name FROM ability")

	if err != nil {
		return nil,err
	}

	defer rows.Close()

	var toReturn []models.GetAllAbilitiesResponse

	for rows.Next() {
		var abilityResponse models.GetAllAbilitiesResponse
		err = rows.Scan(&abilityResponse.ID, &abilityResponse.Name)

		if err != nil {
			return nil, err
		}

		toReturn = append(toReturn, abilityResponse)
	}

	return toReturn, nil
}

func GetAbilityDetails(id int) (models.GetAbilityDetailsResponse, error) {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/patrongg")

	if err != nil {
		return models.GetAbilityDetailsResponse{}, err
	}

	defer db.Close()

	stm, err := db.Prepare("SELECT ability.id, ability.name, description, is_ultimate, h.name FROM ability INNER JOIN hero h ON h.id = ability.fk_hero WHERE ability.id = ?")
	if err != nil {
		return models.GetAbilityDetailsResponse{}, err // proper error handling instead of panic in your app
	}

	var abilityDetail models.GetAbilityDetailsResponse
	err = stm.QueryRow(id).Scan(&abilityDetail.ID, &abilityDetail.Name, &abilityDetail.Description, &abilityDetail.IsUltimate, &abilityDetail.HeroName)


	return abilityDetail, nil
}

func GetHeroAbilities(id int) ([]models.Ability, error) {

	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/patrongg")

	if err != nil {
		return nil, err
	}

	defer db.Close()

	rows, err := db.Query("SELECT * FROM ability INNER JOIN hero ON hero.id = ability.fk_hero WHERE fk_hero = ?", id)

	if err != nil {
		return nil,err
	}

	defer rows.Close()

	var toReturn []models.Ability
	for rows.Next() {

		var ability models.Ability
		var hero models.Hero

		err = rows.Scan(&ability.ID, &ability.Name, &ability.Description, &ability.IsUltimate, &hero.ID, &hero.ID, &hero.Name, &hero.RealName, &hero.Health, &hero.Armour, &hero.Shield)
		ability.AbilityHero = hero

		if err != nil {
			return nil, err
		}

		toReturn = append(toReturn, ability)
	}

	return toReturn,nil
}

func GetHeroes() ([]models.Hero, error) {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/patrongg")

	if err != nil {
		return nil, err
	}

	defer db.Close()

	rows, err := db.Query("SELECT * FROM hero")

	if err != nil {
		return nil,err
	}

	defer rows.Close()

	var toReturn []models.Hero

	for rows.Next() {
		var hero models.Hero
		err = rows.Scan(&hero.ID, &hero.Name, &hero.RealName, &hero.Health, &hero.Armour, &hero.Shield)

		if err != nil {
			return nil, err
		}

		toReturn = append(toReturn, hero)
	}

	return toReturn, nil
}

func GetHero(id int) (models.Hero, error) {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/patrongg")

	if err != nil {
		return models.Hero{}, err
	}

	defer db.Close()

	stm, err := db.Prepare("SELECT * FROM hero WHERE id = ?")
	if err != nil {
		return models.Hero{}, err // proper error handling instead of panic in your app
	}
	defer stm.Close()

	var hero models.Hero
	err = stm.QueryRow(id).Scan(&hero.ID, &hero.Name, &hero.RealName, &hero.Health, &hero.Armour, &hero.Shield)

	if err != nil {
		return models.Hero{}, err
	}

	return hero, nil
}

func InsertHero(hero models.Hero) {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/patrongg")

	if err != nil {
		fmt.Println(err.Error())
		return
	}

	defer db.Close()

	stmt, err := db.Prepare("INSERT INTO hero (id, name, real_name, health, armour, shield) VALUES(?, ?, ?, ?, ?, ?)")

	if err != nil {
		fmt.Println(err.Error())
		return
	}

	_, err = stmt.Exec(hero.ID, hero.Name, hero.RealName, hero.Health, hero.Armour, hero.Shield)

	if err != nil {
		fmt.Println(err.Error())
		return
	}
}

func InsertAbility(ability models.Ability) {
	db, err := sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/patrongg")

	if err != nil {
		fmt.Println(err.Error())
		return
	}

	defer db.Close()

	stmt, err := db.Prepare("INSERT INTO ability (id, name, description, is_ultimate, fk_hero) VALUES(?, ?, ?, ?, ?)")

	if err != nil {
		fmt.Println(err.Error())
		return
	}

	_, err = stmt.Exec(ability.ID, ability.Name, ability.Description, ability.IsUltimate, ability.AbilityHero.ID)

	if err != nil {
		fmt.Println(err.Error())
		return
	}
}