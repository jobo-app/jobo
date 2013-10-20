# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Set up the module
window.Blang = angular.module("blang", ["ngResource", "angularFileUpload"])

Blang.config ["$httpProvider", ($httpProvider) ->
  # Inject the CSRF token
  csrfToken = $("meta[name=csrf-token]").attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrfToken

  # By default, angular sends "application/json, text/plain, */*" which rails
  # sees and focuses on the */* and sends html :-(
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
]

# Here's our JobUpdate resource for interacting with the server
Blang.factory "JobUpdate", ($resource) -> $resource "/job_updates/:id", id: "@id"

# JobUpdate Controller
Blang.controller "JobUpdateCtrl", ($scope, $http, JobUpdate) ->
  job_id = $('[ng-controller=JobUpdateCtrl]').data('job-id')

  # This is the jobUpdate we use for the form
  $scope.jobUpdate = new JobUpdate()

  # JobUpdates for the list
  $scope.jobUpdates = JobUpdate.query(job_id: job_id)

  # Add a new jobUpdate
  $scope.add = () ->
    # add to the local array and also save to the server
    $scope.jobUpdates.unshift JobUpdate.save(description: $scope.jobUpdate.description, job_id: job_id)
    # reset the jobUpdate for the form
    $scope.jobUpdate = new JobUpdate()

  # Delete a jobUpdate
  $scope.delete = ($index) ->
    # Yay, UX!
    if confirm("Are you sure you want to delete this job update?")
      # Remove from the server
      $scope.jobUpdates[$index].$delete()
      # Remove from the local array
      $scope.jobUpdates.splice($index, 1)

  # Add an attachment to a jobUpdate
  $scope.onFileUpload = (jobUpdate, $files) ->
    attachment = $files[0]
    $http.uploadFile
      url: '/job_updates/:id/upload'.replace(/:id/, jobUpdate.id),
      data:
        jobUpdate: jobUpdate
        asset: attachment
      headers:
        'X-CSRF-Token': $("meta[name=csrf-token]").attr('content')

  # Remove the attachment for a jobUpdate
  $scope.removeAttachment = (jobUpdate) ->
    jobUpdate.asset_url = null
