# ProductivityHub

This is a Rails 7.0 API application with a graphql interface. It handles basic functions of creating and retrieving Tasks and Notes.

The basic concept is the existance of a Project that can have kanban style tasks and a dynamic creation of notes.

For the KanBan functionality each project has a structure of Sections that define the status or scope of each task. Consequentially each section can have multiple tasks in which we can define and describe what needs to be done, and if needed assign specific due dates.

On the note-taking side, we have a set of Notes attached to a project. Each Note can have a subset of pages so that logic and scope can be separated on a UX perspective. The way we create the pages is by creating individual blocks that basically behave like lines in each page. In each block we need to set the text and define it's type which we can use to change the styling on the frontend later on.

## Setup

In order to set up the project just download this repo and run the following commands:

1. Install the dependencies: `bundle install`
2. We need to set up the database. It automatically feeds some data so that we can use the project right away.
`bin/rails db:setup`
3. Start the server: `bin/rails s`
4. Visit our basic Graphql interface: http://`localhost:3000/graphiql`

## Usage

I have created this file with basic mutations and queries that can be used through the graphql UI.

Just uncomment the block you want to be executed.

```
# query {
#   project(id: 1) {
#     id
#     title
#     sections {
#       id
#       title
#       tasks {
#         id
#         title
#         description
#         dueDate
#         completed
#       }
#     }
#   }
# }

# query {
#   task(id: 1) {
#     id
#     title
#     description
#     dueDate
#     completed
#     section {
#       id
#       title
#       tasks {
#         id
#         title
#       }
#     }
#   }
# }

# query {
#   project(id: 1) {
#     id
#     title
#     notes{
#       id
#       title
#       pages {
#         id
#         title
#         fullText
#         # blocks {
#         #   id
#         #   text
#         # }
#       }
#     }
#   }
# }

# query{
#   note(id: 1){
#     id
#     pages{
#       fullText
#     }
#   }
# }

# query{
#   page(id: 1){
#    fullText
#     blocks {
#       id
#       text
#     }
#   }
# }



# mutation {
#   createProject(input: {title: "Yolo"}){
#     success
#     errors{
#       code
#       message
#     }
#     project {
#       id
#     }
#   }
# }

# mutation {
#   updateProject(input: {id: 5, title: "Kilimanjaro"}) {
#     success
#     errors{
#       code
#     }
#     project{
#       id
#       title
#       description
#     }
#   }
# }

# mutation{
#   deleteProject(input: {id: 5}){
#     success
#     errors{
#       code
#       message
#     }
#   }
# }
```

## Test

Unit tests, queries and mutations are covered for our functionality in the respective folders.

In order to run the tests we just have to run:

`rspec`

## Improvements

Given more time i would like to enhance the following:

1. Shared functionalities such as creation of users and teams with their respective permissions.
2. Add features in the Task such as user that can watch and be assigned to a task.
3. A task labeling system
4. The ability to upload attachments in a task.
5. Add attachments to pages
6. Give more flexibility to page's blocks so that a user can have more options on the styling of each line such as highliting.
