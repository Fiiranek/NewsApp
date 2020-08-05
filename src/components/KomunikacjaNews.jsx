import React, { useState, useEffect } from 'react'
import firebase from '../Firebase'
import '../App.css'
function useNews() {
    const [news, setNews] = useState([])
    useEffect(() => {
        firebase.firestore().collection('komunikacja').onSnapshot((snapshot) => {
            const newNews = snapshot.docs.map((doc) => (
                {

                    id: doc.id,
                    ...doc.data(),

                }
            )
            )

            setNews(newNews)
        })
    }, [])

    return news
}

const deleteNews = (id) => {
    firebase
      .firestore()
      .collection('komunikacja')
      .doc(id)
      .delete()
}


function displayDate(milliseconds) {
    return new Date(milliseconds).toLocaleDateString()
}

const NewsList = () => {
    const news = useNews()
    return (
        <div>
        <h2>Komunikacja</h2>
        <div className="newsContainer">
            
            {news.map((news, i) =>

                <div key={i} className="card" style={cardStyle}>
                    <img className="card-img-top" src={news.imageUrl} alt="Card image cap" />
                    <div className="card-body">
                        <h5 className="card-title">{news.title}</h5>
                        <p className="card-text">{news.author}</p>
                        <p className="card-text"><small className="text-muted">{displayDate(news.date)}</small></p>
                        <button className="btn btn-outline-danger" onClick={() => deleteNews(news.id)} >Usuń</button>
                    </div>
                </div>

            )}
        </div>
        </div>
    )
}

const cardStyle = {
    width: '18rem'
}


export default NewsList