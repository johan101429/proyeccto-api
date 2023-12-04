import express, { application } from 'express';
import morgan from'morgan'
//Routes
import IndexRoutes from './routes/index.routes'
import postRoutes from './routes/post.routes'


export class App {

    private app = application

    constructor(private port?: number | string) {
        this.app = express();
        this.settings();
        this.middlewares();
        this.routes();
    }

    settings() {
        this.app.set('port',this.port || process.env.PORT || 3000);
    }

    middlewares(){
        this.app.use(morgan('dev'));
        // this.app.use(express.urlencoded({extended:false}));
        this.app.use(express.json());
    }

    routes(){
        this.app.use(IndexRoutes);
        this.app.use('/Arriendo',postRoutes);
    }



    async listen() {
        await this.app.listen(3000)
        console.log('server on port', 3000);


    }

}