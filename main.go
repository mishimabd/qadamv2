package main

import (
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
	"qadamv2/controllers"
	"qadamv2/initializers"
	"qadamv2/middleware"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectDB()
}

func main() {
	r := gin.Default()
	r.GET("/hello", controllers.Hello)
	r.POST("/user/signup", controllers.SignUp)
	r.GET("/user/validate", middleware.RequireAuth, controllers.Validate)
	r.POST("/user/login", controllers.Login)
	r.POST("/admin/create", middleware.RequireAdminAuth, controllers.CreateUser)
	r.GET("/admin/users", middleware.RequireAdminAuth, controllers.GetAllUsers)
	r.GET("/admin/users/:id", middleware.RequireAdminAuth, controllers.GetOneUser)
	r.PUT("./admin/users/:id", middleware.RequireAdminAuth, controllers.UpdateOneUser)
	r.DELETE("/admin/users/:id", middleware.RequireAdminAuth, controllers.DeleteUser)
	r.GET("/user/courses", controllers.GetCourses)
	r.Run(":8080")
}
