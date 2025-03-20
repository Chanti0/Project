CREATE DATABASE disease_inputs;
USE disease_inputs;

CREATE TABLE userss (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL unique,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    phone VARCHAR(20) NOT NULL unique,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE disease_inform (
    id INT PRIMARY KEY AUTO_INCREMENT,
    disease VARCHAR(255),
    symptoms TEXT,
    medicines TEXT,
    diet TEXT,
    specialist VARCHAR(255)
);

INSERT INTO disease_inform (disease, symptoms, medicines, diet, specialist)
VALUES 
-- ✅ Common Diseases
('Flu', 'fever,cough,body ache', 'Paracetamol, Cough Syrup', 'Drink warm fluids, Rest', 'General Physician'),
('Diabetes', 'frequent urination,excessive thirst,weight loss', 'Metformin, Insulin', 'Low sugar diet, Regular exercise', 'Endocrinologist'),
('Hypertension', 'high blood pressure,headache,dizziness', 'Amlodipine, Lisinopril', 'Low salt diet, Regular exercise', 'Cardiologist'),
('Asthma', 'shortness of breath,wheezing,cough', 'Inhalers, Montelukast', 'Avoid allergens, Breathing exercises', 'Pulmonologist'),
('Migraine', 'severe headache,nausea,sensitivity to light', 'Painkillers, Triptans', 'Stay hydrated, Avoid triggers', 'Neurologist'),

-- ✅ Infections
('Pneumonia', 'fever,cough,chest pain,shortness of breath', 'Antibiotics, Cough Syrup', 'Rest, Hydration, Warm fluids', 'Pulmonologist'),
('Tuberculosis', 'chronic cough,weight loss,night sweats,fever', 'Rifampin, Isoniazid', 'Nutritious diet, Avoid smoking', 'Pulmonologist'),
('Hepatitis B', 'jaundice,abdominal pain,fatigue,nausea', 'Antiviral drugs', 'Low-fat diet, Avoid alcohol', 'Hepatologist'),
('Typhoid', 'high fever,weakness,abdominal pain,diarrhea', 'Antibiotics, ORS', 'Hydration, Light diet', 'General Physician'),
('Dengue', 'high fever,body pain,skin rash,bleeding gums', 'Pain relievers, IV fluids', 'Hydration, Rest', 'General Physician'),

-- ✅ Neurological Disorders
('Epilepsy', 'seizures,confusion,uncontrollable movements', 'Anti-epileptic drugs', 'Balanced diet, Avoid triggers', 'Neurologist'),
('Parkinson’s Disease', 'tremors,stiffness,slow movement,imbalance', 'Levodopa, Dopamine agonists', 'Regular exercise, Healthy diet', 'Neurologist'),
('Multiple Sclerosis', 'fatigue,vision problems,weakness,coordination loss', 'Steroids, Immunotherapy', 'Anti-inflammatory diet', 'Neurologist'),

-- ✅ Cardiovascular Diseases
('Heart Attack', 'chest pain,shortness of breath,nausea,sweating', 'Aspirin, Beta-blockers', 'Low cholesterol diet, Avoid fried food', 'Cardiologist'),
('Stroke', 'numbness,confusion,slurred speech,vision loss', 'Blood thinners, Clot busters', 'Healthy diet, Regular exercise', 'Neurologist'),

-- ✅ Digestive Disorders
('Gastritis', 'stomach pain,nausea,bloating,indigestion', 'Antacids, Proton pump inhibitors', 'Avoid spicy food, Eat smaller meals', 'Gastroenterologist'),
('IBS', 'abdominal pain,bloating,diarrhea,constipation', 'Antispasmodics, Probiotics', 'High-fiber diet, Avoid dairy', 'Gastroenterologist'),
('Celiac Disease', 'diarrhea,weight loss,fatigue,bloating', 'Gluten-free diet, Supplements', 'Avoid wheat, barley, rye', 'Gastroenterologist'),

-- ✅ Skin Diseases
('Eczema', 'redness,itching,dry skin,rash', 'Moisturizers, Steroid creams', 'Avoid allergens, Hydration', 'Dermatologist'),
('Psoriasis', 'red patches,scaly skin,itching,burning', 'Topical corticosteroids, Light therapy', 'Omega-3 diet, Moisturization', 'Dermatologist'),
('Acne', 'pimples,oily skin,blackheads,whiteheads', 'Benzoyl peroxide, Retinoids', 'Avoid oily food, Clean skin regularly', 'Dermatologist'),

-- ✅ Autoimmune Disorders
('Lupus', 'joint pain,skin rash,fatigue,fever', 'Steroids, Immunosuppressants', 'Anti-inflammatory diet, Vitamin D', 'Rheumatologist'),
('Rheumatoid Arthritis', 'joint pain,swelling,stiffness,fatigue', 'NSAIDs, Methotrexate', 'Healthy diet, Omega-3 foods', 'Rheumatologist'),

-- ✅ Mental Health Disorders
('Depression', 'sadness,loss of interest,sleep issues,fatigue', 'Antidepressants, Therapy', 'Balanced diet, Regular sleep', 'Psychiatrist'),
('Anxiety', 'excessive worry,restlessness,rapid heartbeat,sweating', 'Anti-anxiety meds, Therapy', 'Caffeine-free diet, Meditation', 'Psychiatrist'),
('Schizophrenia', 'hallucinations,delusions,disorganized thinking', 'Antipsychotic drugs, Therapy', 'Nutritious diet, Avoid stress', 'Psychiatrist'),

-- ✅ Rare Diseases
('Cystic Fibrosis', 'persistent cough,lung infections,shortness of breath', 'Mucus thinners, Enzyme therapy', 'High-calorie diet, Hydration', 'Pulmonologist'),
('ALS', 'muscle weakness,speech problems,difficulty swallowing', 'Riluzole, Physical therapy', 'Balanced diet, Assistive devices', 'Neurologist');


SELECT * FROM disease_inform;
SELECT * FROM userss;

DROP TABLE userss
