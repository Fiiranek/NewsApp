import React,{useState} from 'react'
import '../App.css'
import firebase from '../Firebase'

const AddNews = () => {
    var now = new Date();
    var date= now.getTime();

    const [title, setTitle] = useState('')
    const [author, setAuthor] = useState('')
    const [imageUrl, setImageUrl] = useState('')
    const [content, setContent] = useState('')
    const [tag, setTag] = useState('')
    const [collection , setCollection] = useState('zycieMiasta')


    function onSubmit(e){
        e.preventDefault()

        firebase.firestore().collection(collection).add({
            title,
            author,
            content,
            imageUrl,
            date,
            tag
        }).then(() => {
            setAuthor('')
            setContent('')
            setImageUrl('')
            setTitle('')
            setTag('')
            
        })
    }

    

    return (
        <div>
        <select className="form-control form-control-lg" name="" id="" onChange={e => setCollection(e.currentTarget.value)}>
                <option value="zycieMiasta">Życie miasta</option>
                <option value="komunikacja">Komunikacja</option>
                <option value="biznes">Biznes</option>
                <option value="sport">Sport</option>
                <option value="kultura">Kultura</option>
                <option value="dzielnice">Dzielnice</option>
            </select>
        <form onSubmit={onSubmit}>
            <div className="form-group">
                <input className="form-control" placeholder="Tytuł" type="text" value={title} onChange={e => setTitle(e.currentTarget.value)}/>
                <input className="form-control" placeholder="Autor" type="text" value={author} onChange={e => setAuthor(e.currentTarget.value)}/>
                <input className="form-control" placeholder="Url obrazka" type="text" value={imageUrl} onChange={e => setImageUrl(e.currentTarget.value)}/>
                <input className="form-control" placeholder="Tag" type="text" value={tag} onChange={e => setTag(e.currentTarget.value)}/>
                <textarea placeholder="Treść" className="form-control" value={content} onChange={e => setContent(e.currentTarget.value)}cols="30" rows="10"></textarea>
                
            </div>
            <input type="submit" className="btn btn-primary" value="Dodaj"/>
        </form>
        </div>
    )
}

export default AddNews
