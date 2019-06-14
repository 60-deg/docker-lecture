package main

import (
	"net/http"
	"os"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {
	// Echo instance
	e := echo.New()
	
	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// Static Files
	e.Static("/", "client/dist")
	e.Static("/static", "client/dist/static")
	e.File("*", "client/dist/index.html")
	
	// Routes
	e.GET("greeting", GetGreeting)

	// Start server
	portEnv := os.Getenv("PORT")
	e.Logger.Fatal(e.Start(portEnv))
}

// Handlers

// GetGreeting return GREETING_MESSAGE
func GetGreeting(c echo.Context) error {
	greetingMessageEnv := os.Getenv("GREETING_MESSAGE")
	return c.String(http.StatusOK, greetingMessageEnv)
}