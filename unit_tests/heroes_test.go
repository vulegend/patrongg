package unit_tests

import (
	"patrongg/database"
	"testing"
)

func TestGetHero(t *testing.T) {
	hero, err := database.GetHero(1)

	if err != nil {
		t.Error("Error occured during testing")
	}

	if hero.RealName != "Ana Amari" {
		t.Errorf("Name is incorrect. Expecting: %s, got: %s", "Ana Amari", hero.RealName)
	}
}
