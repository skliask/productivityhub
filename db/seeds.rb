require 'faker'

2.times do
  project = Project.create(
    title: Faker::Space.unique.nebula,
    description: Faker::Lorem.paragraph
  )

  3.times do
    section = project.sections.create(
      title: Faker::Space.galaxy,
    )

    4.times do
      section.tasks.create(
        title: Faker::Space.planet,
        description: Faker::Lorem.paragraph,
        due_date: Faker::Date.between(from: Date.today, to: Date.today + 1.month),
        completed: Faker::Boolean.boolean
      )
    end
  end

  2.times do
    note = project.notes.create(
      title: Faker::Space.galaxy
    )

    2.times do
      page = note.pages.create(
        title: Faker::Space.planet
      )

      5.times do
        page.blocks.create(
          text: Faker::Lorem.sentence,
          block_type: Faker::Number.between(from: 0, to: 3)
        )
      end
    end
  end
end

p "Seeds completed!"
