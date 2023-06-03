
-- #####   POSTS QUERIES

-- Imprimir los posts con sus respuestas

select 
posts.id as postId,
posts.content as postContent,
users_posts.user_id as postedBy,
(select name from users where id = users_posts.user_id) as postedByName,
(select count(*) from posts_likes where post_id = posts.id) as likesCount,
answers.id as answerId,
answers.content as answerContent,
users_answers.user_id as answeredById,
(select name from users where id = users_answers.user_id) as answeredByName
from posts
inner join answers on posts.id = answers.posts_id
inner join users_posts on posts.id = users_posts.user_id
inner join users on posts.id = users.id
inner join users_answers on answers.id = users_answers.answer_id
left join posts_likes on posts.id = posts_likes.post_id;



-- findPostById
    SELECT posts.*, technologies.id as technologyId, technologies.name as technologyName, users.name as userName, users.lastname as userLastname, users.image as userImage, users.id as userId
    FROM posts
    LEFT JOIN users on posts.postedBy = users.id
    LEFT JOIN technologies ON posts.technology = technologies.id
    WHERE posts.id = ?;



-- findPostLikeByUserId
    SELECT * FROM posts_likes WHERE post_id = ? AND user_id = ?;
  

-- findPostAnswers
    SELECT answers.*, count(answers_likes.user_id) as totalLikes
    FROM answers
    left join answers_likes on answers.id = answers_likes.answer_id
    WHERE posts_id = ? GROUP BY answers.id
    ORDER BY createdAt DESC LIMIT ? OFFSET ?;


-- countTotalAnswers
    SELECT COUNT(*) as totalAnswers FROM answers WHERE posts_id = ?;

-- removePostLike
    DELETE FROM posts_likes WHERE post_id = ? AND user_id = ?;

-- setPostLike
    INSERT INTO posts_likes (post_id, user_id, date) VALUES (?, ?, NOW());

-- findPostLikes
    SELECT * FROM posts_likes WHERE post_id = ?;

-- count Post likes
    SELECT COUNT(*) AS totalLikes FROM posts_likes WHERE post_id = ?;

-- updatePost
    UPDATE posts SET title = ?, content = ? WHERE id = ?;

-- addPostView
    UPDATE posts SET views = views + 1 WHERE id = ?;

-- findPosts
  SELECT * from posts LIMIT ? OFFSET ?;
 
-- countTotalPosts
  SELECT COUNT(*) AS totalPosts FROM posts;


-- findPostsBySearchType
    SELECT posts.*,
    count(distinct posts_likes.id) as likes,
    count(distinct answers.id) as numAnswers,
    users.name as userName,
    users.lastname as userLastname,
    users.image as userImage
    FROM posts
    LEFT JOIN posts_likes ON posts.id = posts_likes.post_id
    LEFT JOIN answers ON posts.id = answers.posts_id
    LEFT JOIN users on posts.postedBy = users.id
    WHERE posts.?? like ? GROUP BY posts.id ORDER BY ?? ${direction} LIMIT ? OFFSET ?;
  

-- findPostByTechnology
    SELECT
    posts.*,
    count(distinct posts_likes.id) as likes,
    count(distinct answers.id) as numAnswers,
    users.name as userName,
    users.lastname as userLastname,
    users.image as userImage
    FROM posts
    INNER JOIN technologies ON posts.technology = technologies.id
    LEFT JOIN posts_likes on posts.id = posts_likes.post_id
    LEFT JOIN answers ON posts.id = answers.posts_id
    LEFT JOIN users on posts.postedBy = users.id
    WHERE technologies.name = ? && posts.content like ? GROUP BY posts.id ORDER BY ?? ${ direction } LIMIT ? OFFSET ?;

-- findPostsByDate
    SELECT posts.*,
    count(distinct posts_likes.id) as likes,
    count(distinct answers.id) as numAnswers,
    users.name as userName,
    users.lastname as userLastname,
    users.image as userImage
    FROM posts
    LEFT JOIN posts_likes ON posts.id = posts_likes.post_id
    LEFT JOIN answers ON posts.id = answers.posts_id
    LEFT JOIN users on posts.postedBy = users.id
    WHERE posts.content like ? && postedAt BETWEEN ? AND ? + INTERVAL '1' DAY
    GROUP BY posts.id ORDER BY ?? ${direction} LIMIT ? OFFSET ?;

-- findPostsByAnswersQuantity
  SELECT posts.*,
  count(distinct answers.id) as numAnswers,
  count(distinct posts_likes.id) as likes,
  users.name as userName,
  users.lastname as userLastname,
  users.image as userImage
  FROM posts
  LEFT JOIN answers ON posts.id = answers.posts_id
  LEFT JOIN posts_likes ON posts.id = posts_likes.post_id
  LEFT JOIN users on posts.postedBy = users.id
  WHERE posts.content LIKE ?
  GROUP BY posts.id HAVING numAnswers >= ? ORDER BY ?? ${ direction } LIMIT ? OFFSET ?;

-- createNewPost
    INSERT INTO posts (title, content, technology, postedBy, postedAt)
    VALUES (?, ?, ?, ?, NOW());

-- removePostById
    DELETE FROM posts WHERE id = ?;


-- #####   ANSWERS QUERIES

-- findAnswerById
    SELECT * FROM answers WHERE id = ?;

-- removeAnswerById
    DELETE FROM answers WHERE id = ?;

-- findAnswerLikeByUserId
    SELECT * FROM answers_likes WHERE answer_id = ? AND user_id = ?;

-- setAnswerLike
    INSERT INTO answers_likes (answer_id, user_id, date) VALUES (?, ?, NOW());

-- removeAnswerLike
    DELETE FROM answers_likes WHERE answer_id = ? AND user_id = ?;

--findAnswerLikes
    SELECT * FROM answers_likes WHERE answer_id = ?;

-- countAnswerLikes
    SELECT COUNT(*) AS totalLikes FROM answers_likes WHERE answer_id = ?;

-- createNewAnswer
    INSERT INTO answers (content, postedBy, posts_id, createdAt) VALUES (?, ?, ?, NOW());


-- #####   TECHNOLOGIES QUERIES

-- registerNewTechnology
        INSERT INTO technologies (name) VALUES (?);

findTechnologyById
    SELECT * FROM technologies WHERE id = ?;

-- findTechnologies
    SELECT * FROM technologies;

-- findTechnologyByName
    SELECT * FROM technologies WHERE name = ?;

-- #####   USERS QUERIES

-- createUser
      INSERT INTO users(
        name, lastname, email, password, verificationCode, role,
        createdAt, image
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?);

-- findUsers
    SELECT id, name, lastname, email, role, image, technologies, createdAt, verifiedAt FROM users LIMIT ? OFFSET ?;

-- countTotalUsers
    SELECT COUNT(*) AS totalUsers FROM users;

-- createUserByFirebaseAuth
      INSERT INTO users(
        name, lastname, email, password, verificationCode,
        createdAt, google, image
      ) VALUES (?, ?, ?, ?, ?, ?, 1, ?);

-- findUserByEmail
    select id, name, lastname, email, role, password, verifiedAt from users where email = ?;

-- activateUser
    UPDATE users
    SET verifiedAt = ?
    WHERE verificationCode = ?
    AND verifiedAt IS NULL;


-- getUserByVerificationCode
    SELECT name, email
    FROM users WHERE verificationCode = ?;

-- findUserById
    SELECT users.id, users.name, users.lastname, users.email, users.image, users.role, users.password, users.createdAt, users.verifiedAt, users.lastAuthUpdate, users.technologies, users.linkedin, technologies.name as technologyName
    FROM users 
    left join technologies on users.technologies = technologies.id
    WHERE users.id = ?;

-- updateUserWithPassword
    UPDATE users
    SET name = ?, lastname = ?, email = ?, password = ?, updatedAt = ?
    WHERE id = ?;

-- updateUserWithoutPassword
    UPDATE users
    SET name = ?, lastname = ?, email = ?, updatedAt = ?
    WHERE id = ?;


-- updateRole
    UPDATE users set role = ?, technologies = ? where id = ?;

-- setAdmin
    UPDATE users set role = 'admin' where id = ?;

-- updateVerificationCode
    UPDATE users set verificationCode = ?, updatedAt = ?, verifiedAt = NULL where id = ?;

-- setLastAuthUpdate
    UPDATE users set lastAuthUpdate = ? where id = ?;

-- getLastUpdate
    SELECT lastAuthUpdate FROM users where id = ?;

-- setUserImage
    UPDATE users set image = ? where id = ?;

-- removeUserById
    UPDATE users set verifiedAt = NULL, createdAt = NULL  where id = ?;

-- findUserAnswers
  SELECT posts.*, answers.*, users.name, users.lastname, users.image, count(posts_likes.id)postLikes, count(answers_likes.id)answerLikes FROM (
    SELECT id answerId, answers.content answerContent, answers.createdAt answerCreatedAt, posts_id FROM answers WHERE postedBy = ?
    ORDER BY createdAt DESC
  ) as answers
  LEFT JOIN posts ON answers.posts_id = posts.id
  LEFT JOIN users ON posts.postedBy = users.id
  LEFT JOIN posts_likes ON posts.id = posts_likes.post_id
  LEFT JOIN answers_likes ON answers.answerId = answers_likes.answer_id
  GROUP BY answerId
  LIMIT ? OFFSET ?;

-- TotalUserAnswers
    SELECT COUNT(id) as totalAnswers FROM answers WHERE postedBy = ?;

-- findUserPosts
  SELECT posts.*,
  count(posts_likes.post_id) as likes,
  count(answers.posts_id) as numAnswers,
  users.name as userName,
  users.lastname as userLastname,
  users.image as userImage
  FROM posts
  LEFT JOIN posts_likes ON posts.id = posts_likes.post_id
  LEFT JOIN answers ON posts.id = answers.posts_id
  LEFT JOIN users on posts.postedBy = users.id
  WHERE posts.postedBy like ? GROUP BY posts.id LIMIT ? OFFSET ?;

-- TotalUserPosts
    SELECT COUNT(id) as totalPosts FROM posts WHERE postedBy = ?;

-- findPublicationLikesGivenByUser
    select *, 'post' as type from posts_likes where user_id = ?
    union all
    select *, 'answer' as type from answers_likes
    where user_id = ? LIMIT ? OFFSET ?;

-- countTotalLikesGivenByUser
    select count(*) as totalLikedPublications from
    (
      select id, post_id, user_id, date from posts_likes where user_id = ?
      union all
      select id, answer_id, user_id, date from answers_likes
      where user_id = ?
    ) likes;


-- findUserRating
  SELECT
    (select count(*) from posts
                inner join posts_likes on posts.id = posts_likes.post_id where posts.postedBy = ?) + 
    (select count(*) from answers
                inner join answers_likes on answers.id = answers_likes.answer_id where answers.postedBy = ?) as userRating;