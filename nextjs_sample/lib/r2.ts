import { S3Client } from "@aws-sdk/client-s3"

const R2_ACCESS_KEY_ID = process.env.R2_ACCESS_KEY_ID!
const R2_SECRET_ACCESS_KEY = process.env.R2_SECRET_ACCESS_KEY!
const R2_ENDPOINT = process.env.R2_ENDPOINT!

if (!R2_ACCESS_KEY_ID || !R2_SECRET_ACCESS_KEY || !R2_ENDPOINT) {
    if (process.env.NODE_ENV === 'development') {
        console.warn('R2 credentials missing. Document uploads will fail.')
    }
}

export const r2 = new S3Client({
    region: "auto",
    endpoint: R2_ENDPOINT,
    credentials: {
        accessKeyId: R2_ACCESS_KEY_ID,
        secretAccessKey: R2_SECRET_ACCESS_KEY,
    },
})

export const R2_BUCKET_NAME = process.env.R2_BUCKET_NAME || 'nirbhoy'
export const R2_PUBLIC_DOMAIN = process.env.R2_PUBLIC_DOMAIN // e.g., https://cdn-nirbhoy.nojor.de
