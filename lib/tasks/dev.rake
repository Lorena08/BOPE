namespace :dev do

  desc "Task que roda todas tasks"
  task setup: :environment do

    images_path = Rails.root.join('public', 'system')

    puts "Apagando public/system #{%x(rm -rf #{images_path})}" #rm=remove rf=remove de qlq forma
    puts %x(rails db:drop)
    puts %x(rails db:create)
    puts %x(rails db:migrate)
    puts %x(rails db:seed)
    puts %x(rails dev:generate_users)
    puts %x(rails dev:generate_teams)
    puts %x(rails dev:generate_team_user)
    puts %x(rails dev:generate_sprints)
    puts %x(rails dev:generate_projects)
    puts %x(rails dev:generate_project_sprints)
    puts %x(rails dev:generate_colors)
    puts %x(rails dev:generate_labels)
    puts %x(rails dev:generate_statuses)
    puts %x(rails dev:generate_activities)

  end
#---------------------------------------------------#

  desc "Cadastra os usuários"
  task generate_users: :environment do

    puts "Gerando USUÁRIOS FAKES..."

    10.times do
      user = User.create!(
              email: Faker::Internet.email,
              password: 123456,
              password_confirmation: 123456
              )

      UserProfile.create!(
        name: Faker::Name.name,
        student_number: Faker::Number.number(10),
        user_id: user.id,
        role: Random.rand(0..1)#sorteia se o usuario é admin ou nao
        )
    end

    puts "Gerando USUÁRIOS FAKES... [OK]"
  end
#---------------------------------------------------#

  task generate_teams: :environment do

    puts "Gerando EQUIPES FAKES..."

    @teams_name = teams_name

    @teams_name.each do |name|
      Team.create!(
        description: name
      )
    end

    puts "Gerando EQUIPES FAKES... [OK]"
  end
#---------------------------------------------------#
  task generate_team_user: :environment do

    puts "Gerando a relação entre USÁRIOS e EQUIPES..."

    Team.all.each do |team|
      10.times do
        TeamUser.create!(
          team_id: team.id,
          user_id: User.all.sample.id
          )
      end
    end

    puts "Gerando a relação entre USÁRIOS e EQUIPES... [OK]"
  end
#---------------------------------------------------#
  task generate_sprints: :environment do

    puts "Gerando os SPRINTS..."

    10.times do
      Sprint.create!(
        description: LeroleroGenerator.sentence, #gera sentenças
        inicio: Faker::Date.between(Date.today, 3.month.from_now), #gera datas aleatorias entre hoje e 3 meses (a partir de hoje)
        fim: Faker::Date.between(3.month.from_now, 6.month.from_now), ##gera datas aleatorias entre 3 meses a partir de hoje e 6 meses (a partir de hoje)
        pontos_cadastrados: Random.rand(0..25) # gera numeros alaetorios entre 0 e 25
        # pontos_atualizados:
        )
    end

    puts "Gerando os SPRINTS... [OK]"
  end
#---------------------------------------------------#

  task generate_projects: :environment do

    puts "Gerando os PROJETOS..."

    Team.all.each do |team|
      Project.create!(
        description: Faker::Lorem.sentence,
        team_id: team.id
        )
    end

    puts "Gerando os PROJETOS... [OK]"
  end
#---------------------------------------------------#

  task generate_project_sprints: :environment do

    puts "Gerando a relação entre PROJETOS e SPRINTS..."

    Project.all.each do |project|
      4.times do
        ProjectSprint.create!(
          project_id: project.id,
          sprint_id: Sprint.all.sample.id
          )
      end
    end

    puts "Gerando a relação entre PROJETOS e SPRINTS... [OK]"
  end
#---------------------------------------------------#

  task generate_colors: :environment do

    puts "Gerando as CORES..."

    colors = colors_name
    colors.each do |color|
      Color.create!(
        description: color
      )
    end

    puts "Gerando as CORES... [OK]"
  end
#---------------------------------------------------#

  task generate_labels: :environment do

    puts "Gerando os RÓTULOS..."

    Color.all.each do |color|
      Label.create!(
        description: Faker::Lorem.word,
        color_id: color.id
      )
    end

    puts "Gerando os RÓTULOS... [OK]"
  end
#---------------------------------------------------#

  task generate_statuses: :environment do

    puts "Gerando os STATUS..."

    status_color = status_name_color

    status_color.each do |status, color|
      Status.create!(
        description: status,
        color_id: Color.where(description: color).first.id
      )
    end

    puts "Gerando os STATUS... [OK]"
  end
#---------------------------------------------------#

  task generate_activities: :environment do

    puts "Gerando as ATIVIDADES..."

    Sprint.all.each do |sprint|
      Activity.create!(
        description: LeroleroGenerator.sentence,
        pontos_cadastrados: Random.rand(0..25),
        status_id: Status.all.sample.id,
        label_id: Label.all.sample.id,
        sprint_id: sprint.id
        )
    end

    puts "Gerando as ATIVIDADES... [OK]"
  end
#---------------------------------------------------#
  private

  def teams_name
    names = ['Azul', 'Vermelho', 'Amarelo', 'Preto']
  end

  def colors_name
    colors = ["Amarelo", "Verde", "Azul", "Branco"]
  end

  def status_name_color
    status_color = [["Não iniciada", "Amarelo"],
                    ["Em andamento", "Verde"],
                    ["Validado", "Azul"],
                    ["Aguardando validação", "Branco"]]
  end


end
