bodyApp = angular.module "bodyApp", []

bodyApp.factory "selectorsService", ->
	activeCls : "active"

bodyApp.factory "dataService", ->
	exercises : [
		{ 
			title: "title 1"
			descr: "descr 1"
			count: 1
		},{
			title: "title 2"
			descr: "descr 2"
			count: 2
		},{
			title: "title 3"
			descr: "descr 3"
			count: 3
		},{
			title: "title 4"
			descr: "descr 4"
			count: 4
		}
	]
	

bodyApp.directive "touch", ->
	restrict : "A"
	#template : ''
	#scope : {}
	controller : ($scope, selectorsService ) ->
		$scope.activeCls = selectorsService.activeCls

	link : (scope, element, attrs) ->

		element.bind "mouseover", (event) ->
			element.addClass(scope.activeCls)

		element.bind "mouseout", (event) ->
			element.removeClass(scope.activeCls)

		element.bind "click", (event) ->
			#scope.$apply( attrs.redirectFn() )
			scope.redirect( element.find("h4").text()  )
			#console.log("click on " + element.find("h4").text() )


bodyApp.controller "ExercisesCtrl", ($scope, dataService) ->
	$scope.exercises = dataService.exercises

	$scope.redirect = (url) ->
		console.log("redirect to " + url )
	
