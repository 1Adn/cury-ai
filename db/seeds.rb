# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Profile.destroy_all
User.destroy_all

puts 'Création des utilisateurs...'
user1 = User.create!(email: 'jean@example.com', password: 'password1')
user2 = User.create!(email: 'lucas@example.com', password: 'password2')
user3 = User.create!(email: 'zoe@example.com', password: 'password3')
puts 'Terminé'

puts 'Création des profils...'
profile1 = Profile.create!(
  first_name: 'Jean',
  last_name: 'DuJardin',
  address: "15 Rue du Moulin de la Tour d'Ivoire",
  age: '29',
  phone_number: '0672470859',
  email: 'jean@example.com',
  user_id: user1.id
)
profile2 = Profile.create!(
  first_name: 'Lucas',
  last_name: 'Dupont',
  address: "17 allée des lutins, 75010, Paris",
  age: '22',
  phone_number: '0674470959',
  email: 'lucas@example.com',
  user_id: user2.id
)
puts 'Terminé'

puts 'Création des diplômes...'
Degree.create!(
  title: 'Licence en Informatique',
  level: 'Bac +3',
  field: 'Informatique',
  school: 'Université de Paris',
  profile_id: profile1.id
)
Degree.create!(
  title: 'Master en Génie Informatique',
  level: 'Bac +5',
  field: 'Génie Informatique',
  school: 'École Polytechnique',
  profile_id: profile1.id
)
Degree.create!(
  title: 'Doctorat en Intelligence Artificielle',
  level: 'Doctora',
  field: 'Intelligence Artificielle',
  school: "Université de Stanford",
  profile_id: profile1.id
)
Degree.create!(
  title: 'Licence en Informatique',
  level: 'Bac',
  field: 'Informatique',
  school: 'Université de Paris',
  profile_id: profile2.id
)
Degree.create!(
  title: 'Master en Génie Informatique',
  level: 'Bac +2',
  field: 'Génie Informatique',
  school: 'École Polytechnique',
  profile_id: profile2.id
)
Degree.create!(
  title: 'Doctorat en Intelligence Artificielle',
  level: 'Bac +5',
  field: 'Intelligence Artificielle',
  school: "Université de Stanford",
  profile_id: profile2.id
)
puts 'Terminé'

puts 'Création des compétences...'
Skill.create!(
  title: 'Ruby on Rails',
  level: 'Junior (0-2 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'JavaScript',
  level: 'Junior (0-2 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Python',
  level: 'Junior (0-2 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Apprentissage Automatique',
  level: 'Experimented (2-5 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Science des Données',
  level: 'Experimented (2-5 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'React.js',
  level: 'Senior (5+ years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Planification de Projet',
  level: 'Experimented (2-5 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Gestion des Ressources',
  level: 'Experimented (2-5 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Suivi des Progrès',
  level: 'Experimented (2-5 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Analyse des Risques',
  level: 'Experimented (2-5 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Communication de Projet',
  level: 'Experimented (2-5 years)',
  profile_id: profile1.id
)
Skill.create!(
  title: 'Ruby on Rails',
  level: 'Junior (0-2 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'JavaScript',
  level: 'Junior (0-2 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'Python',
  level: 'Junior (0-2 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'Apprentissage Automatique',
  level: 'Experimented (2-5 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'Science des Données',
  level: 'Experimented (2-5 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'React.js',
  level: 'Senior (5+ years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'Planification de Projet',
  level: 'Experimented (2-5 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'Gestion des Ressources',
  level: 'Experimented (2-5 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'Suivi des Progrès',
  level: 'Experimented (2-5 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'Analyse des Risques',
  level: 'Experimented (2-5 years)',
  profile_id: profile2.id
)
Skill.create!(
  title: 'Communication de Projet',
  level: 'Experimented (2-5 years)',
  profile_id: profile2.id
)
puts 'Terminé'

puts 'Création des langues...'
Language.create!(
  title: 'Français',
  level: 'C2 (maîtrise complète)',
  profile_id: profile1.id
)
Language.create!(
  title: 'Anglais',
  level: 'B2 (intermédiaire avancé)',
  profile_id: profile1.id
)
Language.create!(
  title: 'Allemand',
  level: 'A1 (débutant absolu)',
  profile_id: profile1.id
)
Language.create!(
  title: 'Français',
  level: 'C2 (maîtrise complète)',
  profile_id: profile2.id
)
Language.create!(
  title: 'Anglais',
  level: 'B2 (intermédiaire avancé)',
  profile_id: profile2.id
)
Language.create!(
  title: 'Allemand',
  level: 'A1 (débutant absolu)',
  profile_id: profile2.id
)
puts 'Terminé'

puts 'Création des expériences...'
Experience.create!(
  title: 'Ingénieur Logiciel',
  experience_type: 'Professional Experience',
  field: 'Développement Logiciel',
  starting_date: '2017-05-01',
  ending_date: '2022-08-31',
  description: "En tant qu'ingénieur logiciel, j'ai été responsable du développement et de la maintenance d'applications web complexes utilisant les technologies Ruby on Rails et React.js. Mon travail comprenait la conception de nouvelles fonctionnalités, l'optimisation des performances et la résolution de bugs.",
  profile_id: profile1.id
)
Experience.create!(
  title: 'Stagiaire Analyste de Données',
  experience_type: 'Internships and Apprenticeships',
  field: 'Analyse de Données',
  starting_date: '2016-06-01',
  ending_date: '2016-08-31',
  description: "En tant que stagiaire analyste de données, j'ai travaillé sur des projets d'analyse de données visant à extraire des informations significatives à partir de vastes ensembles de données. J'ai utilisé des techniques d'analyse statistique et des outils informatiques pour présenter des insights précieux pour la prise de décision commerciale.",
  profile_id: profile1.id
)
Experience.create!(
  title: 'Développeur Web Freelance',
  experience_type: 'Freelance Projects',
  field: 'Développement Web',
  starting_date: '2015-01-01',
  ending_date: '2017-04-30',
  description: "En tant que développeur web freelance, j'ai collaboré avec divers clients pour concevoir, développer et maintenir des sites web. Mon rôle comprenait la création d'interfaces utilisateur attractives, le développement de fonctionnalités personnalisées et l'intégration de solutions de commerce électronique.",
  profile_id: profile1.id
)
Experience.create!(
  title: 'Étudiant en Échange',
  experience_type: 'International Experience',
  field: "Programme d'Échange Étudiant",
  starting_date: '2014-09-01',
  ending_date: '2015-06-30',
  description: "En participant à un programme d'échange étudiant, j'ai eu l'opportunité d'étudier à l'étranger à l'Université de Californie, Berkeley. Cette expérience m'a permis d'explorer de nouvelles cultures, d'améliorer mes compétences linguistiques et d'acquérir une perspective internationale sur l'éducation et la vie universitaire.",
  profile_id: profile1.id
)
Experience.create!(
  title: 'Ingénieur Logiciel',
  experience_type: 'Professional Experience',
  field: 'Développement Logiciel',
  starting_date: '2017-05-01',
  ending_date: '2022-08-31',
  description: "En tant qu'ingénieur logiciel, j'ai été responsable du développement et de la maintenance d'applications web complexes utilisant les technologies Ruby on Rails et React.js. Mon travail comprenait la conception de nouvelles fonctionnalités, l'optimisation des performances et la résolution de bugs.",
  profile_id: profile2.id
)
Experience.create!(
  title: 'Stagiaire Analyste de Données',
  experience_type: 'Internships and Apprenticeships',
  field: 'Analyse de Données',
  starting_date: '2016-06-01',
  ending_date: '2016-08-31',
  description: "En tant que stagiaire analyste de données, j'ai travaillé sur des projets d'analyse de données visant à extraire des informations significatives à partir de vastes ensembles de données. J'ai utilisé des techniques d'analyse statistique et des outils informatiques pour présenter des insights précieux pour la prise de décision commerciale.",
  profile_id: profile2.id
)
Experience.create!(
  title: 'Développeur Web Freelance',
  experience_type: 'Freelance Projects',
  field: 'Développement Web',
  starting_date: '2015-01-01',
  ending_date: '2017-04-30',
  description: "En tant que développeur web freelance, j'ai collaboré avec divers clients pour concevoir, développer et maintenir des sites web. Mon rôle comprenait la création d'interfaces utilisateur attractives, le développement de fonctionnalités personnalisées et l'intégration de solutions de commerce électronique.",
  profile_id: profile2.id
)
Experience.create!(
  title: 'Étudiant en Échange',
  experience_type: 'International Experience',
  field: "Programme d'Échange Étudiant",
  starting_date: '2014-09-01',
  ending_date: '2015-06-30',
  description: "En participant à un programme d'échange étudiant, j'ai eu l'opportunité d'étudier à l'étranger à l'Université de Californie, Berkeley. Cette expérience m'a permis d'explorer de nouvelles cultures, d'améliorer mes compétences linguistiques et d'acquérir une perspective internationale sur l'éducation et la vie universitaire.",
  profile_id: profile2.id
)
puts 'Terminé'
