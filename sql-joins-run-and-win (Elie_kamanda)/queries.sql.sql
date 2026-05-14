 __STRUCTURE BD RUN & WIN RDC 

__La liste de toutes les ventes

SELECT v.date_vente,
       p.nom_produit,
       v.quantite_vendue,
       v2.nom_ville      
FROM ventes v 
LEFT JOIN produits p 
ON v.id_vente = p.id_produit 
FULL  JOIN villes v2 
ON V.id_vente = V2.id_ville;

__ 2. Les performances à lEst

SELECT p.nom_produit,
	   p.prix,
	   v.quantite_vendue,
	   m.nom_magasin,
	   v.date_vente,
	   v2.nom_ville
FROM ventes v 
FULL JOIN produits p 
ON v.id_vente = p.id_produit 
FULL JOIN magasins m 
ON v.id_vente = m.id_magasin 
FULL JOIN villes v2 
ON v.id_vente = V2.id_ville 
WHERE V2.nom_ville IN  ('Goma','Bukavu')

__ 3. Le top Katanga (les produits de la catégorie Running vendue a Lubumbashi)

SELECT p.nom_produit,
       c.nom_categorie,
       SUM(v.quantite_vendue) AS total_quantite_vendue,
       v.date_vente,
       v2.nom_ville
FROM ventes v 
INNER JOIN produits p 
ON v.id_vente = p.id_produit 
INNER JOIN categories c 
ON v.id_vente = c.id_categorie 
INNER JOIN villes v2 
ON v.id_vente = v2.id_ville 
WHERE c.nom_categorie = 'Running'
AND v2.nom_ville = 'Lubumbashi'
GROUP BY v.quantite_vendue 

__ 4. Analyse du Chiffre d’Affaires

SELECT (v.quantite_vendue * p.prix ) AS chiffre_affaire,
       m.nom_magasin,
       v2.nom_ville
FROM ventes v 
INNER JOIN produits p 
ON v.id_vente = p.id_produit
INNER JOIN magasins m 
ON v.id_vente = m.id_magasin 
INNER JOIN villes v2 
ON v.id_vente = v2.id_ville 
ORDER BY chiffre_affaire  DESC

5. Les catégories des produits vendues par ville

SELECT  c.nom_categorie,
       v.nom_ville
FROM  categories c
INNER JOIN villes v 
ON c.id_categorie = v.id_ville 
